import UIKit
import MessageUI

final class DonateVC:
ViewController,
DonateView {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableViewModel?.tableView = tableView
            tableView.register(nibModels: [DonateItemListCellViewModel.self])
        }
    }
    
    // MARK: - Public
    
    var onCardDonate: ((WebViewConfigurationModel) -> Void)?
    
    var viewModel: DonateViewModelAbstract?
    var tableBuilder: DonateVCTableBuilderAbstract?
    var tableViewModel: TableManagerable?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
}

fileprivate extension DonateVC {
    
    // MARK: - Configure
    
    func configureTableView() {
        let onSelectHandler: DonateItemListCellViewModel.OnClick = { [weak self] model in
            switch model.donateType {
            case .card:
                guard
                    let configModel = self?.viewModel?.configurationBankDonateModel
                else { return }
                
                self?.onCardDonate?(configModel)
            case .sms:
                self?.showSMS()
            }
            
        }
        let items = tableBuilder?.map(onSelectHandler) ?? []
        tableViewModel?.setNewItems([items])
    }
}

extension DonateVC: MFMessageComposeViewControllerDelegate {
    
    func showSMS() {
        let messageVC = configureSMSComposerVC(toRecepients: [GlobalConstants.smsCodeForDonate], body: "Верим ")
        
        messageVC.messageComposeDelegate = self
        
        if MFMessageComposeViewController.canSendText() {
            self.present(messageVC, animated: true, completion: nil)
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
