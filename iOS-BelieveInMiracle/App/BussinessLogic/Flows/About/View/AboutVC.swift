import UIKit

final class AboutVC:
ViewController,
AboutView {

    var onOpenSocial: ((String?, String) -> Void)?
    var onOpenLink: ((String) -> Void)?
    
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
                                           AboutSocialCellViewModel.self,
                                           AppProductionCellViewModel.self])
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
                self?.onOpenSocial?(GlobalConstants.Social.App.vk,
                                    GlobalConstants.Social.Browser.vk)
            case .instagram:
                self?.onOpenSocial?(GlobalConstants.Social.App.instagram,
                                    GlobalConstants.Social.Browser.instagram)
            case .facebook:
                self?.onOpenSocial?(nil,
                                    GlobalConstants.Social.Browser.facebook)
            }
        }
        
        let openLink: OptionalStringCompletion = { [weak self] link in
            guard let link = link else { return }
            self?.onOpenLink?(link)
        }
        
        tableViewModel?.setNewItems([tableBuilder?.map(onSocial: socialComplection,
                                                       onOpenLink: openLink) ?? []])
    }
}
