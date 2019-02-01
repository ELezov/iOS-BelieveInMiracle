import UIKit

final class KidsListVC:
ViewController,
KidsListView {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(nibModels: [KidsListItemCellViewModel.self, LoadingCellViewModel.self])
            tableViewModel?.tableView = tableView
        }
    }
    
    var viewModel: KidsListViewModelAbstract?
    var kidsNetworkManager: KidsNetworkManager?
    
    var tableViewModel: TablePaginable?
    var page: Int = 0
    var allKids = [Kid]()
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsNetworkManager = KidsNetworkManager()
        configureTableView()
        tableViewModel?.setNewItems([[]])
        tableViewModel?.onPagingEvent = { [weak self] in
            self?.page += 1
            self?.fetchKids()
        }
    }
    
    func configureTableView() {
        tableViewModel?.shouldShowLoading = true
        let refreshControl = UIRefreshControl()
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(updateKidsList(_:)), for: .valueChanged)

    }
    
    @objc func updateKidsList(_ sender: Any) {
        print("haha")
    }
    
    func fetchKids() {
        kidsNetworkManager?.getKids(page: page) { [weak self] kids in
            guard
                let `self` = self,
                let kids = kids
            else { return }
            if kids.count < 10 {
                self.tableViewModel?.shouldShowLoading = false
            }
            
            self.allKids.append(contentsOf: self.filterKids(kids: kids))
            let cellVMs = self.allKids.map({ return KidsListItemCellViewModel(kid: $0) })
            self.tableViewModel?.setNewItems([cellVMs])//.appendItems(items: cellVMs, section: 0)
            //setNewItems([cellVMs])//(items: cellVMs, section: 0)
        }
    }
    
    func filterKids(kids: [Kid]) -> [Kid] {
        let filteredKids = kids.filter({
            $0.dieday?.nilIfEmpty == nil })
        // && $0.fullName?.nilIfEmpty != nil })
        return filteredKids
    }
}
