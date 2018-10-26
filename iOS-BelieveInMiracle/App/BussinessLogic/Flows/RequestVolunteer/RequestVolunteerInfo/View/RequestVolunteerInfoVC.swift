import UIKit
import MessageUI

final class RequestVolunteerInfoVC:
ViewController,
RequestVolunteerInfoView {
    
    var viewModel: RequestVolunteerInfoViewModelAbstract?
    
    @IBOutlet weak private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildTextFields()
        configureSaveButton()
    }
    
    func buildTextFields() {
        let nameConfigModel = TextFieldViewConfigurationModel(placeholder: "Имя", type: .text)
        let phoneConfigModel = TextFieldViewConfigurationModel(placeholder: "Телефон", type: .phone)
        let emailConfigModel = TextFieldViewConfigurationModel(placeholder: "email", type: .mail)
        if let nameView = TextFieldView.setup(configModel: nameConfigModel) {
            stackView.addArrangedSubview(nameView)
        }
        
        if let phoneView = TextFieldView.setup(configModel: phoneConfigModel) {
            stackView.addArrangedSubview(phoneView)
        }
        
        if let mailView = TextFieldView.setup(configModel: emailConfigModel) {
            stackView.addArrangedSubview(mailView)
        }
    }
    
    func configureSaveButton() {
        let download = UIBarButtonItem(title: "Сохранить",
                                       style: .plain,
                                       target: self,
                                       action: #selector(saveTap))
        
        let attributes: [NSAttributedStringKey: AnyObject] = [.foregroundColor: UIColor(Color.textPrimaryInverse)]
        download.setTitleTextAttributes(attributes, for: .normal)
        self.navigationItem.rightBarButtonItem = download
    }
    
    @objc func saveTap() {
        showMail()
    }
    
}

extension RequestVolunteerInfoVC: MFMailComposeViewControllerDelegate {
    
    func showMail() {
        let messageVC = configureMailComposerVC(
            toRecepients: ["mail@mail.ru"],
            subject: "Новая заявка в волонтеры через мобильное приложение",
            body: "CCCC")
        
        messageVC.mailComposeDelegate = self
        messageVC.navigationBar.tintColor = UIColor.white
        
        if MFMailComposeViewController.canSendMail() {
            showIndicatorView()
            self.present(messageVC, animated: true, completion: { [weak self] in
                self?.hideIndicatorView()
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
            break
        case .cancelled:
            break
        case .failed:
            break
        case .saved:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
