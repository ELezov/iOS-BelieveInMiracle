import UIKit

final class RequestVolunteerVC:
ViewController,
RequestVolunteerView {
    
    enum Constants {
        static let continueHeight: CGFloat = 64.0
        static let zeroHeight: CGFloat = 0.0
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableViewModel?.tableView = tableView
            tableView.register(nibModels: [RequestVolunterTypeBaseCellViewModel.self])
        }
    }
    @IBOutlet weak private var continueContainer: UIView!
    @IBOutlet weak private var continueContainerHeight: NSLayoutConstraint!
    @IBOutlet weak private var continueButton: ActionButton! {
        didSet {
            continueButton.setTitle(L10n.Common.Button.continue, for: .normal)
        }
    }
    
    // MARK: - Public
    
    var viewModel: RequestVolunteerViewModelAbstract?
    var tableBuilder: RequestVolunteerVCTableBuilderAbstract?
    var tableViewModel: TableManagerable?
    
    var checkArray: [Bool]?
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        continueContainerHeight.constant = Constants.zeroHeight
    }
}

fileprivate extension RequestVolunteerVC {
    
    // MARK: - Configure
    
    func configureTableView() {
        let items = tableBuilder?.map({
            self.tableViewModel?.tableView?.beginUpdates()
            self.tableViewModel?.tableView?.endUpdates()
        },
        onCheck: { [weak self] model in
            guard var checkArray = self?.checkArray else { return }
            checkArray[model.tag] = model.isChecked
            let isSelected = checkArray.first(where: { $0 == true }) != nil
            self?.checkArray = checkArray
            self?.continueContainerHeight.constant = (isSelected) ? Constants.continueHeight : Constants.zeroHeight
        }) ?? []
        checkArray = Array(repeating: false, count: items.count)
        tableViewModel?.setNewItems([items])
    }
}
