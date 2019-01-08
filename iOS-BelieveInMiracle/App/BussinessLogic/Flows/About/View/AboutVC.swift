import UIKit

final class AboutVC:
ViewController,
AboutView {
    
    var onOpenVK: EmptyCompletion?
    
    // MARK: - Public Variable
    
    var viewModel: AboutViewModelAbstract?
    var tableBuilder: AboutVCTableBuilderAbstract?
    var tableViewModel: TableManagerable?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.register(nibModels: [AboutTopCellViewModel.self,
                                           AboutProgrammsCellViewModel.self,
                                           AboutInfoCellViewModel.self,
                                           AboutSocialCellViewModel.self])
            tableViewModel?.tableView = tableView
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.About.title
        configureTableView()
    }
}

fileprivate extension AboutVC {
    func configureTableView() {
        let socialComplection: SocialTypeCompletion = { [weak self] type in
            switch type {
            case .vk:
                self?.onOpenVK?()
            default:
                break
            }
        }
        
        tableViewModel?.setNewItems([tableBuilder?.map(onSocial: socialComplection) ?? []])
    }
}
