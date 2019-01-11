import UIKit

final class DonateVC:
ViewController,
DonateView {
   
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.register(nibModels: [DonateItemListCellViewModel.self])
            tableView.backgroundColor = Color.Base.white
            tableViewModel?.tableView = tableView
        }
    }
    
    // MARK: - Public
    
    var onCardDonate: ((WebViewConfigurationModel) -> Void)?
    var onSmsDonate: EmptyCompletion?
    
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
                self?.onSmsDonate?()
            }
        }
        let items = tableBuilder?.map(onSelectHandler) ?? []
        tableViewModel?.setNewItems([items])
    }
}
