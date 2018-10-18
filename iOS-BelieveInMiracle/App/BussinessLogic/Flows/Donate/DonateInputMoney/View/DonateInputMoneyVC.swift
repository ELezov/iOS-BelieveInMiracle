import UIKit
import MessageUI

final class DonateInputMoneyVC:
ViewController,
DonateInputMoneyView {
    
    var onContinueTapped: EmptyCompletion?
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var bottomConstraint: NSLayoutConstraint!
    
    enum Constants {
        static let placeholder = "Введите сумму пожертвований"
        static let buttonTitle = "Продолжить"
        static let buttonHeight = 38
        static let inputHeight = 30
        static let inputPadding = 32
    }
    
    var inputMoney: UITextField = {
        let view = UITextField()
        view.placeholder = Constants.placeholder
        view.keyboardType = .numberPad
        view.borderStyle = .roundedRect
        return view
    }()
    
    var button: UIButton = {
        let view = UIButton()
        view.setTitle(Constants.buttonTitle, for: .normal)
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 4
        return view
    }()
    
    var viewModel: DonateInputMoneyViewModelAbstract?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func keyboardWillShow(notification: NSNotification) {
        super.keyboardWillShow(notification: notification)
        bottomConstraint.constant = -keyboardHight
    }
    
    override func keyboardWillHide() {
        super.keyboardWillHide()
        bottomConstraint.constant = keyboardHight
    }
}

fileprivate extension DonateInputMoneyVC {
    func configureUI() {
        containerView.addSubview(inputMoney)
        inputMoney.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.inputHeight)
            make.left.equalToSuperview().offset(Constants.inputPadding)
            make.right.equalToSuperview().offset(-Constants.inputPadding)
        }
        
        containerView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(inputMoney.snp.bottom).offset(Constants.inputPadding)
            make.height.equalTo(Constants.buttonHeight)
            make.left.equalToSuperview().offset(Constants.inputPadding)
            make.right.equalToSuperview().offset(-Constants.inputPadding)
        }
        
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    @objc func continueButtonTapped() {
        guard
            let text = inputMoney.text,
            !text.isEmpty,
            let amount = Int(text)
        else { return }
        inputMoney.resignFirstResponder()
        showSMS(amount: amount)
    }
}

extension DonateInputMoneyVC: MFMessageComposeViewControllerDelegate {
    
    func showSMS(amount: Int) {
        let messageVC = configureSMSComposerVC(
            toRecepients: [GlobalConstants.smsCodeForDonate],
            body: "Верим \(amount)")
        
        messageVC.messageComposeDelegate = self
        
        if MFMessageComposeViewController.canSendText() {
            showIndicatorView()
            self.present(messageVC, animated: true, completion: { [weak self] in
               self?.hideIndicatorView()
            })
        }
    }
    
    func configureSMSComposerVC(
        toRecepients: [String],
        subject: String? = nil,
        body: String? = nil) -> MFMessageComposeViewController {
        let smsVC = MFMessageComposeViewController()
        smsVC.body = body
        smsVC.recipients = toRecepients
        smsVC.subject = subject
        return smsVC
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        switch result {
        case .sent:
            break
        case .cancelled:
            break
        case .failed:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
}
