import Foundation

typealias ErrorCompletion = (Error) -> Void
typealias StringCompletion = (String) -> Void
typealias D3DSCompletion = (String?, String?, String) -> Void

final class DonatePaymentViewModel: ViewModel, DonatePaymentViewModelAbstract {
    
    let networkService: NetworkService
    let cloudPaymentManager: CloudPaymentsManagerable
    
    init(networkService: NetworkService,
         cloudPaymentManager: CloudPaymentsManagerable) {
        self.networkService = networkService
        self.cloudPaymentManager = cloudPaymentManager
    }
    
    func makeCryptogramPacket(cardNumber: String, andExpDate: String, andCVV: String) -> String? {
        return cloudPaymentManager.makeSecurePacket(cardNumber: cardNumber,
                                                    expirationDate: andExpDate,
                                                    cvvNumber: andCVV)
    }
    
    // Это тестовое приложение и запросы выполняются на прямую на сервер CloudPayment
    // Не храните пароль для API в приложении!
    // Правильно выполнять запросы по этой схеме:
    // 1) В приложении необходимо получить данные карты: номер, срок действия, имя держателя и CVV.
    // 2) Создать криптограмму карточных данных при помощи SDK.
    // 3) Отправить криптограмму и все данные для платежа с мобильного устройства на ваш сервер.
    // 4) С сервера выполнить оплату через платежное API CloudPayments.
    
    func charge(cardCryptogramPacket: String,
                cardHolderName: String,
                success: StringCompletion?,
                failure: StringCompletion?,
                d3dsCompletion: D3DSCompletion?) {
        networkService.charge(cardCryptogramPacket: cardCryptogramPacket,
                              cardHolderName: cardHolderName) { [weak self] result in
                        switch result {
                        case .success(let transactionResponse):
                            self?.checkTransactionResponse(
                                transactionResponse: transactionResponse,
                                success: success,
                                failure: failure,
                                d3dsCompletion: d3dsCompletion)
                        case .failure(let error):
                            failure?(error.localizedDescription)
                        }
        }
    }
    
    func auth(cardCryptogramPacket: String,
              cardHolderName: String,
              success: StringCompletion?,
              failure: StringCompletion?,
              d3dsCompletion: D3DSCompletion?) {
        
        networkService.auth(cardCryptogramPacket: cardCryptogramPacket,
                            cardHolderName: cardHolderName) { [weak self] result in
            switch result {
            case .success(let transactionResponse):
                self?.checkTransactionResponse(
                    transactionResponse: transactionResponse,
                    success: success,
                    failure: failure,
                    d3dsCompletion: d3dsCompletion)
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        }
    }
    
    // Проверяем необходимо ли подтверждение с использованием 3DS
    func checkTransactionResponse(transactionResponse: TransactionResponse,
                                  success: StringCompletion?,
                                  failure: StringCompletion?,
                                  d3dsCompletion: D3DSCompletion?) {
        if transactionResponse.success {
            // Показываем результат
            success?(transactionResponse.transaction?.cardHolderMessage ?? "")
        } else {
            
            if !transactionResponse.message.isEmpty {
                failure?(transactionResponse.message)
                return
            }
            if transactionResponse.transaction?.paReq != nil && transactionResponse.transaction?.acsUrl != nil {
                
                let transactionId = String(describing: transactionResponse.transaction?.transactionId ?? 0)
                d3dsCompletion?(transactionResponse.transaction?.acsUrl,
                                transactionResponse.transaction?.paReq,
                                transactionId)
            } else {
                success?(transactionResponse.transaction?.cardHolderMessage ?? "")
            }
        }
    }
    
    func post3ds(transactionId: String,
                 paRes: String,
                 success: StringCompletion?,
                 failure: StringCompletion?,
                 d3dsCompletion: D3DSCompletion?) {
        
        networkService.post3ds(transactionId: transactionId,
                               paRes: paRes) { [weak self] result in
            switch result {
            case .success(let transactionResponse):
                self?.checkTransactionResponse(
                    transactionResponse: transactionResponse,
                    success: success,
                    failure: failure,
                    d3dsCompletion: d3dsCompletion)
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        }
    }
}
