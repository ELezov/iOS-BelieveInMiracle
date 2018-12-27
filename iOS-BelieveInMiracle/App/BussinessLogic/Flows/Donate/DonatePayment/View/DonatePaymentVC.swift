import UIKit
import PassKit
import NotificationBannerSwift

enum PayType {
    case charge
    case auth
}

//swiftlint:disable large_tuple
final class DonatePaymentVC:
ViewController,
DonatePaymentView {
    
    private lazy var numberCardView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Donate.Payment.Card.number,
            type: .creditCard)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    private lazy var holderNameView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Donate.Payment.Card.holder,
            type: .text)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    private lazy var expDateView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Donate.Payment.Card.expiration,
            type: .expDate)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    private lazy var cvvView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Donate.Payment.Card.cvv,
            type: .cvv)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    var onApplePay: PaymentCompletion?
    
    var viewModel: DonatePaymentViewModelAbstract?
    
    private var payType: PayType = .charge
    
    private let network = NetworkService()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var buttonContinue: ActionButton! {
        didSet {
            buttonContinue.status = .enabled
            buttonContinue.setTitle(L10n.Donate.Payment.Card.pay, for: .normal)
        }
    }
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var buttonApplePay: UIButton!
    
    @IBOutlet private weak var cardView: UIView!
    
    @IBOutlet private weak var labelNumberCard: UILabel!
    @IBOutlet private weak var labelExpDate: UILabel!
    @IBOutlet private weak var labelCardHolder: UILabel!
    
    @IBOutlet weak var imageViewPaymentIcon: UIImageView! {
        didSet {
            imageViewPaymentIcon.contentMode = .scaleAspectFit
        }
    }
    
    // Платежные системы для Apple Pay
    let supportedPaymentNetworks = [PKPaymentNetwork.visa,
                                    PKPaymentNetwork.masterCard]
    let applePayMerchantID = "merchant.com.YOURDOMAIN" // Ваш ID для Apple Pay!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    // MARK: - Actions
    
    @IBAction private func onPayClick(_ sender: Any) {
        
        guard let (cardNumber, holderName, expDate, cvv) = getPaymentInfoAndValid() else { return }

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
    
    func getPaymentInfoAndValid() -> (cardNumber: String, holderName: String, expDate: String, cvv: String)? {
        // Получаем введенные данные банковской карты
        guard let cardNumber = numberCardView?.textWithoutMask, !cardNumber.isEmpty else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCardNumber,
                                    style: .danger).show()
            return nil
        }
        
        if !Card.isCardNumberValid(cardNumber) {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCorrectCardNumber,
                                    style: .danger).show()
            return nil
        }
        
        guard let expDate = expDateView?.text, expDateView?.dynamicFill.value ?? false else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterExpirationDate,
                                    style: .danger).show()
            return nil
        }
        
        guard let holderName = holderNameView?.text, !holderName.isEmpty else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCardHolder,
                                    style: .danger).show()
            return nil
        }
        
        guard let cvv = cvvView?.text, cvvView?.dynamicFill.value ?? false else {
            NotificationBanner.init(title: L10n.Donate.Payment.errorWord,
                                    subtitle: L10n.Donate.Payment.enterCVVCode,
                                    style: .danger).show()
            return nil
        }
        return (cardNumber, holderName, expDate, cvv)
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
            let viewController = PKPaymentAuthorizationViewController(paymentRequest: request)
            else { return }
        
        viewController.delegate = self
        self.present(viewController, animated: true)
    }
}


// MARK: - Configure UI
fileprivate extension DonatePaymentVC {
    
    func configureUI() {
        self.loadingIndicator.isHidden = true
        title = "!Cloud Payments"
        configureCardView()
        configureInputs()
        buttonApplePay.isHidden = !PKPaymentAuthorizationViewController
            .canMakePayments(usingNetworks: supportedPaymentNetworks) // Проверяем возможно ли использовать Apple Pay
    }
    
    func configureCardView() {
        cardView.backgroundColor = UIColor.init(Color.primaryDark)
        cardView.layer.cornerRadius = 8
        labelNumberCard.font = UIFont.systemFont(ofSize: 20)
        labelNumberCard.textColor = UIColor(Color.textPrimaryInverse)
        labelExpDate.textColor = UIColor(Color.textPrimaryInverse)
        labelExpDate.font = UIFont.systemFont(ofSize: 15)
        labelCardHolder.textColor = UIColor(Color.textPrimaryInverse)
        labelCardHolder.font = FontStyle.body2.style()
    }
    
    func configureInputs() {
        guard let nView = numberCardView else { return }
        stackView.addArrangedSubview(nView)
        nView.dynamicChange.bindAndFire(self) { [weak self] text in
            let cardType = Card.cardType(fromCardNumber: nView.textWithoutMask)
            var currentPaymentImage: Image?
            switch cardType {
            case Maestro:
                currentPaymentImage = Asset.Donate.Payment.maestro.image
            case Mir:
                currentPaymentImage = Asset.Donate.Payment.mir.image
            case Visa:
                currentPaymentImage = Asset.Donate.Payment.visa.image
            case MasterCard:
                currentPaymentImage = Asset.Donate.Payment.mastercard.image
            default:
                currentPaymentImage = nil
            }
            self?.imageViewPaymentIcon.image = currentPaymentImage
            self?.labelNumberCard.text = text.new.isEmpty ?
                "0000 0000 0000 0000" : text.new
        }
        
        guard let hView = holderNameView else { return }
        hView.dynamicChange.bindAndFire(self) { [weak self] text in
            self?.labelCardHolder.text = text.new.isEmpty ?
                "CARDHOLDER NAME" : text.new
        }
        stackView.addArrangedSubview(hView)
        
        guard let eView = expDateView else { return }
        stackView.addArrangedSubview(eView)
        eView.dynamicChange.bindAndFire(self) { [weak self] text in
            self?.labelExpDate.text = text.new.isEmpty ? "00/00" : text.new
        }
        
        guard let cView = cvvView else { return }
        stackView.addArrangedSubview(cView)
    }
}
