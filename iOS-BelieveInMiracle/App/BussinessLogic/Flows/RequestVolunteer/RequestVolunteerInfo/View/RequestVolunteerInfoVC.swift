import UIKit
import MessageUI
import NotificationBannerSwift

final class RequestVolunteerInfoVC:
ViewController,
RequestVolunteerInfoView {
    
    var viewModel: RequestVolunteerInfoViewModelAbstract?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet private weak var sendButton: ActionButton! {
        didSet {
            sendButton.status = .disabled
            sendButton.setTitle(L10n.Common.Button.Request.send, for: .normal)
        }
    }
    
    private lazy var nameView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Volunteer.Request.name,
            type: .text)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    private lazy var phoneView: TextFieldView? = {
        let configModel = TextFieldViewConfigurationModel(
            placeholder: L10n.Volunteer.Request.phone,
            type: .phone)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    private lazy var mailView: TextFieldView? = {
       let configModel = TextFieldViewConfigurationModel(
        placeholder: L10n.Volunteer.Request.mail,
        type: .mail)
        let textField = TextFieldView.setup(configModel: configModel)
        return textField
    }()
    
    var isCorrectName: Bool = false {
        didSet {
            checkUnlock()
        }
    }
    
    var isCorrectPhone: Bool = false {
        didSet {
            checkUnlock()
        }
    }
    
    var isCorrectMail: Bool = false {
        didSet {
            checkUnlock()
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func sendButtonTapped(_ sender: Any) {
        showMail()
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTextFields()
    }
}

fileprivate extension RequestVolunteerInfoVC {
    
    func buildTextFields() {
        if let nameView = nameView {
            stackView.addArrangedSubview(nameView)
            nameView.dynamicFill.bindAndFire(self) { [weak self] isFill in
                self?.isCorrectName = isFill.new
            }
        }
        
        if let phoneView = phoneView {
            stackView.addArrangedSubview(phoneView)
            
            phoneView.dynamicFill.bindAndFire(self) { [weak self] isFill in
                self?.isCorrectPhone = isFill.new
            }
        }
        
        if let mailView = mailView {
            stackView.addArrangedSubview(mailView)
            
            mailView.dynamicFill.bindAndFire(self) { [weak self] isFill in
                self?.isCorrectMail = isFill.new
            }
        }
    }
    
    func checkUnlock() {
        if
            isCorrectMail &&
                isCorrectName &&
            isCorrectPhone {
            sendButton.status = .enabled
        }
    }
}

extension RequestVolunteerInfoVC: MFMailComposeViewControllerDelegate {
    
    func showMail() {
        guard
            let name = nameView?.text,
            let phone = phoneView?.text,
            let mail = mailView?.text
        else { return }
        let messageVC = configureMailComposerVC(
            toRecepients: [GlobalConstants.mailForVolunteer],
            subject: L10n.Volunteer.Request.title,
            body: "\(L10n.Volunteer.Request.Question.name) \(name) \n" +
                  "\(L10n.Volunteer.Request.Question.mail) \(mail) \n" +
                  "\(L10n.Volunteer.Request.Question.phone) \(phone)")
        if #available(iOS 11.0, *) {
            messageVC.setPreferredSendingEmailAddress(mail)
        } else {
            // Fallback on earlier versions
        }
        messageVC.mailComposeDelegate = self
        //messageVC.navigationBar.tintColor = UIColor.blue
        
        if MFMailComposeViewController.canSendMail() {
            //showIndicatorView()
            self.present(messageVC, animated: true, completion: { [weak self] in
                //self?.hideIndicatorView()
            })
        }
    }
    
    func configureMailComposerVC(
        toRecepients: [String],
        subject: String,
        body: String) -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.setToRecipients(toRecepients)
        mailComposerVC.setSubject(subject)
        mailComposerVC.setMessageBody(body, isHTML: false)
        return mailComposerVC
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
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        switch result {
        case .sent:
            NotificationBanner.init(title: L10n.Volunteer.Request.Send.success, style: .success).show()
        case .failed:
            NotificationBanner.init(title: L10n.Volunteer.Request.Send.failure, style: .danger).show()
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
