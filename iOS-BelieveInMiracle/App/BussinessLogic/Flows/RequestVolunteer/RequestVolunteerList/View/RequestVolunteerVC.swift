import UIKit

class RequestVolunteerVC:
ViewController,
RequestVolunteerView {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.register(nibModels: [RequestVolunterTypeBaseCellViewModel.self,
                                           RequestVolunterTypeDescriptionCellViewModel.self])
        }
    }
    @IBOutlet weak private var continueContainer: UIView!
    @IBOutlet weak private var continueContainerHeight: NSLayoutConstraint!
    @IBOutlet weak private var continueButton: ActionButton! {
        didSet {
            continueButton.status = .disabled
            continueButton.setTitle(L10n.Common.Button.continue, for: .normal)
        }
    }
    
    // MARK: - Public
    
    var onContinueTapped: EmptyCompletion?
    
    var viewModel: RequestVolunteerViewModelAbstract?
    var tableBuilder: RequestVolunteerVCTableBuilderAbstract?
    var tableViewModels = [CellViewModel]()
    
    var checkArray: [Bool]?
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: Actions
    
    @IBAction private func continueButtonTapped(_ sender: Any) {
        onContinueTapped?()
    }
}

extension RequestVolunteerVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tableViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withModel: model, for: indexPath)
        return cell
    }
    
}

extension RequestVolunteerVC: UITableViewDelegate {
    
}

fileprivate extension RequestVolunteerVC {
    
    // MARK: - Configure
    
    func configureTableView() {
        let items = tableBuilder?.map({ model in
            switch model.expandedState {
            case .collapsed:
                let descriptionModel = RequestVolunterTypeDescriptionCellViewModel(description: model.description)
                guard let index = self.tableViewModels.index(
                    where: { ($0 as? RequestVolunterTypeBaseCellViewModel) === model }) else { return }
                self.tableViewModels.insert(descriptionModel, at: index + 1)
                self.tableView.insertRows(at: [IndexPath(row: index + 1, section: 0)], with: .top)
            case .expanded:
                guard
                    let index = self.tableViewModels.index(
                    where: { ($0 as? RequestVolunterTypeBaseCellViewModel) === model }),
                    let _ = self.tableViewModels[index + 1] as? RequestVolunterTypeDescriptionCellViewModel
                else { return }
                let descriptionIndex = index + 1
                self.tableViewModels.remove(at: descriptionIndex)
                self.tableView.deleteRows(at: [IndexPath(row: descriptionIndex, section: 0)], with: .top)
                
            }
        },
        onCheck: { [weak self] model in
            guard var checkArray = self?.checkArray else { return }
            checkArray[model.tag] = model.isChecked
            let isSelected = checkArray.first(where: { $0 == true }) != nil
            self?.checkArray = checkArray
            self?.continueButton.status = (isSelected) ? .enabled : .disabled
        }) ?? []
        checkArray = Array(repeating: false, count: items.count)
        tableViewModels = items
        tableView.reloadData()
    }
}
