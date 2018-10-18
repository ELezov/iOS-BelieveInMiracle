import UIKit

final class RequestVolunteerVC:
ViewController,
RequestVolunteerView {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableViewModel?.tableView = tableView
            tableView.register(nibModels: [RequestVolunterTypeBaseCellViewModel.self])
        }
    }
    
    var viewModel: RequestVolunteerViewModelAbstract?
    var tableBuilder: RequestVolunteerVCTableBuilderAbstract?
    var tableViewModel: TableManagerable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

fileprivate extension RequestVolunteerVC {
    
    // MARK: - Configure
    
    func configureTableView() {
        let items = tableBuilder?.map({
            self.tableViewModel?.tableView?.reloadData()
        }) ?? []
        tableViewModel?.setNewItems([items])
    }
}
