import UIKit
import PassKit
import NotificationBannerSwift

enum PayType {
    case charge
    case auth
}


final class DonatePaymentVC:
ViewController,
DonatePaymentView {
    
    var onApplePay: PaymentCompletion?
    
    var viewModel: DonatePaymentViewModelAbstract?
    
    private var payType: PayType = .charge
    
    private let network = NetworkService()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var textFieldCardNumber: UITextField!
    @IBOutlet private weak var textFieldExpDate: UITextField!
    @IBOutlet private weak var textFieldHolderName: UITextField!
    @IBOutlet private weak var textFieldCVV: UITextField!
    @IBOutlet private weak var buttonApplePay: UIButton!
    
    // Платежные системы для Apple Pay
    let supportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard]
    let applePayMerchantID = "merchant.com.YOURDOMAIN" // Ваш ID для Apple Pay!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldCardNumber.delegate = self
        textFieldExpDate.delegate = self
        
        self.loadingIndicator.isHidden = true
        title = "Cloud Payments"
        
        buttonApplePay.isHidden = !PKPaymentAuthorizationViewController
            .canMakePayments(usingNetworks: supportedPaymentNetworks) // Проверяем возможно ли использовать Apple Pay
    }

    
    // MARK: - Actions
    
    @IBAction private func onPayClick(_ sender: Any) {
        
        // Получаем введенные данные банковской карты
        guard let cardNumber = textFieldCardNumber.text, !cardNumber.isEmpty else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCardNumber,
                                    style: .danger).show()
            return
        }
        
        if !Card.isCardNumberValid(cardNumber) {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCorrectCardNumber,
                                    style: .danger).show()
            return
        }
        
        guard let expDate = textFieldExpDate.text, expDate.count == 5 else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterExpirationDate,
                                    style: .danger).show()
            return
        }
        
        guard let holderName = textFieldHolderName.text, !holderName.isEmpty else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCardHolder,
                                    style: .danger).show()
            return
        }
        
        guard let cvv = textFieldCVV.text, !cvv.isEmpty else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCVVCode,
                                    style: .danger).show()
            return
        }

        // Создаем криптограмму карточных данных
        // Чтобы создать криптограмму необходим PublicID (свой PublicID можно посмотреть в личном кабинете и затем заменить в файле Constants)
        guard
            let packet = viewModel?.makeCryptogramPacket(cardNumber: cardNumber,
                                                           andExpDate: expDate,
                                                           andCVV: cvv)
        else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.errorCreatingCryptoPacket,
                                    style: .danger).show()
            return
        }
        
        // Используя методы API выполняем оплату по криптограмме
        // (charge (для одностадийного платежа) или auth (для двухстадийного))
        switch payType {
        case .charge:
            charge(cardCryptogramPacket: packet,
                   cardHolderName: holderName)
        case .auth:
            auth(cardCryptogramPacket: packet,
                 cardHolderName: holderName)
        }
    }
    
    @IBAction private func onApplePayClick(_ sender: Any) {
        showApplePayPayment(merchantId: applePayMerchantID, paymentNetworks: supportedPaymentNetworks)
    }
}

// Обработка результата для Apple Pay
// ВНИМАНИЕ! Нельзя тестировать Apple Pay в симуляторе, так как в симуляторе payment.token.paymentData всегда nil
extension DonatePaymentVC: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController,
                                            didAuthorizePayment payment: PKPayment,
                                            completion: @escaping ((PKPaymentAuthorizationStatus) -> Void)) {
        completion(PKPaymentAuthorizationStatus.success)
        
        // Конвертируем объект PKPayment в строку криптограммы
        guard let cryptogram = PKPaymentConverter.convert(toString: payment) else {
            return
        }
        
        print(cryptogram)
        
        // Используя методы API выполняем оплату по криптограмме
        // (charge (для одностадийного платежа) или auth (для двухстадийного))
        switch payType {
        case .charge:
            charge(cardCryptogramPacket: cryptogram, cardHolderName: "")
        case .auth:
            auth(cardCryptogramPacket: cryptogram, cardHolderName: "")
        }
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DonatePaymentVC: UIWebViewDelegate {
    
    /// Handle result from 3DS form
    func webView(_ webView: UIWebView,
                 shouldStartLoadWith request: URLRequest,
                 navigationType: UIWebViewNavigationType) -> Bool {
        let urlString = request.url?.absoluteString
        if urlString == GlobalConstants.cloudpaymentsURL {
            var response: String?
            if let aBody = request.httpBody {
                response = String(data: aBody, encoding: .ascii)
            }
            let responseDictionary = parse(response: response)
            webView.removeFromSuperview()
            post3ds(transactionId: responseDictionary?["MD"] as? String ?? "",
                    paRes: responseDictionary?["PaRes"] as? String ?? "")
            return false
        }
        return true
    }
}

extension DonatePaymentVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        switch textField {
            // Пример определения типа платежной системы по номеру карты:
        // Определяем тип во время ввода номера карты и выводим данные в лог
        case textFieldCardNumber:
            print(Card.cardType(toString: Card.cardType(fromCardNumber: textField.text)))
            return true
        case textFieldExpDate:
            // original answer https://stackoverflow.com/a/47077265
            if range.length > 0 {
                return true
            }
            if string.isEmpty {
                return false
            }
            if range.location > 4 {
                return false
            }
            var originalText = textField.text
            let replacementText = string.replacingOccurrences(of: " ", with: "")
            
            // Verify entered text is a numeric value
            if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: replacementText)) {
                return false
            }
            
            // Put / after 2 digit
            if range.location == 2 {
                originalText?.append("/")
                textField.text = originalText
            }
            return true
            
        default:
            return true
        }
    }
}

// MARK: - Private methods
private extension DonatePaymentVC {
    
    // Это тестовое приложение и запросы выполняются на прямую на сервер CloudPayment
    // Не храните пароль для API в приложении!
    // Правильно выполнять запросы по этой схеме:
    // 1) В приложении необходимо получить данные карты: номер, срок действия, имя держателя и CVV.
    // 2) Создать криптограмму карточных данных при помощи SDK.
    // 3) Отправить криптограмму и все данные для платежа с мобильного устройства на ваш сервер.
    // 4) С сервера выполнить оплату через платежное API CloudPayments.
    
    func charge(cardCryptogramPacket: String, cardHolderName: String) {
        
        self.showLoadingIndicator()
        
        viewModel?.charge(cardCryptogramPacket: cardCryptogramPacket,
                          cardHolderName: cardHolderName,
                          success: { [weak self] message in
                            self?.hideLoadingIndicator()
                            NotificationBanner.init(title: L10n.Donate.Payment.informationWord,
                                                    subtitle: message,
                                                    style: .success).show()
                            
                          }, failure: { [weak self] message in
                            self?.hideLoadingIndicator()
                            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                                    subtitle: message,
                                                    style: .danger).show()
                          }, d3dsCompletion: { [weak self] acs, paReq, transactionsId in
                            self?.hideLoadingIndicator()
                            self?.show3DSPayment(andAcsURLString: acs,
                                                 andPaReqString: paReq,
                                                 andTransactionIdString: transactionsId)
                          })
        
    }
    
    func auth(cardCryptogramPacket: String, cardHolderName: String) {
        
        self.showLoadingIndicator()
        
        viewModel?.auth(cardCryptogramPacket: cardCryptogramPacket,
                          cardHolderName: cardHolderName,
                          success: { [weak self] message in
                            self?.hideLoadingIndicator()
                            NotificationBanner.init(title: L10n.Donate.Payment.informationWord,
                                                    subtitle: message,
                                                    style: .success).show()
                            
            }, failure: { [weak self] message in
                self?.hideLoadingIndicator()
                NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                        subtitle: message,
                                        style: .danger).show()
            }, d3dsCompletion: { [weak self] acs, paReq, transactionsId in
                self?.hideLoadingIndicator()
                self?.show3DSPayment(andAcsURLString: acs,
                                     andPaReqString: paReq,
                                     andTransactionIdString: transactionsId)
        })
    }
    
    func post3ds(transactionId: String, paRes: String) {
        
        self.showLoadingIndicator()
        viewModel?.post3ds(transactionId: transactionId,
                           paRes: paRes,
                           success: { [weak self] message in
                self?.hideLoadingIndicator()
                NotificationBanner.init(title: L10n.Donate.Payment.informationWord,
                                        subtitle: message,
                                        style: .success).show()
            }, failure: { [weak self] message in
                self?.hideLoadingIndicator()
                NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                        subtitle: message,
                                        style: .danger).show()
            }, d3dsCompletion: { [weak self] acs, paReq, transactionsId in
                self?.hideLoadingIndicator()
                self?.show3DSPayment(andAcsURLString: acs,
                                     andPaReqString: paReq,
                                     andTransactionIdString: transactionsId)
        })
        
    }
    
    func showLoadingIndicator() {
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.isHidden = true
    }
    
    // MARK: - Utilities
    
    func parse(response: String?) -> [AnyHashable: Any]? {
        guard let response = response else {
            return nil
        }
        
        let pairs = response.components(separatedBy: "&")
        let elements = pairs.map { $0.components(separatedBy: "=") }
        let dict = elements.reduce(into: [String: String]()) {
            $0[$1[0].removingPercentEncoding!] = $1[1].removingPercentEncoding
        }
        
        return dict
    }
    
    // Показываем 3DS форму
    func show3DSPayment(andAcsURLString: String?, andPaReqString: String?, andTransactionIdString: String) {
        D3DS.make3DSPayment(with: self,
                            andAcsURLString: andAcsURLString,
                            andPaReqString: andPaReqString,
                            andTransactionIdString: andTransactionIdString)
    }
    
    func showApplePayPayment(merchantId: String, paymentNetworks: [PKPaymentNetwork]) {
        // Формируем запрос для Apple Pay
        let request = PKPaymentRequest()
        request.merchantCapabilities = PKMerchantCapability.capability3DS // Возможно использование 3DS
        request.countryCode = "RU" // Код страны
        request.currencyCode = "RUB" // Код валюты
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "Рубль", amount: 1) // Информация о товаре (название и цена)
        ]
        guard
            let vc = PKPaymentAuthorizationViewController(paymentRequest: request)
            else { return }
        
        vc.delegate = self
        self.present(vc, animated: true)
    }
}
