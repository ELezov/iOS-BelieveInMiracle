import UIKit
import Kingfisher


final class KidDetailsVC:
ViewController,
KidDetailsView, UITableViewDelegate {
    
    var onShowHelp: StringCompletion?
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableViewModel?.tableView = tableView
            tableViewModel?.parallaxHeight = 300
            tableView.separatorStyle = .none
            tableView.register(nibModels: [KidDetailsNameCellViewModel.self,
                                           KidDetailsDiagnosisCellViewModel.self,
                                           KidDetailsDescriptionCellViewModel.self,
                                           KidDetailsHelpButtonCellViewModel.self])
        }
    }
    
    var viewModel: KidDetailsViewModelAbstract?
    var tableViewModel: TableParallaxable?
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
}

fileprivate extension KidDetailsVC {
    
    func configureNavBarBackgroundWithColor(alpha: CGFloat) {
        title = (alpha == 1) ? viewModel?.kidFullName : nil
        let color = UIColor.white.withAlphaComponent(alpha)
        let image = UIImage.from(color: color)
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationController?.navigationBar.shadowImage = image
        self.navigationController?.navigationBar.backgroundColor = color
        UIApplication.shared.statusBarView?.backgroundColor = color
    }
    
    func configureNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = nil
    }

    
    func configureTable() {
        var cellVMs = [CellViewModel]()
        if let fullName = viewModel?.kidFullName {
            let cellVM = KidDetailsNameCellViewModel(onClick: nil,
                                                     fullName: fullName)
            cellVMs.append(cellVM)
        }
        if let diagnosis = viewModel?.kidDiagnosis {
            let cellVM = KidDetailsDiagnosisCellViewModel(onClick: nil,
                                                          diagnosis: diagnosis)
            cellVMs.append(cellVM)
        }
        if let descriptionText = viewModel?.kidDescription {
            let cellVM = KidDetailsDescriptionCellViewModel(onClick: nil,
                                                            descriptionText: descriptionText)
            cellVMs.append(cellVM)
        }
        
        if let linkHelped = viewModel?.linkHelped {
            let cellVM = KidDetailsHelpButtonCellViewModel(
                onClick: { [weak self] in
                    self?.onShowHelp?(linkHelped)
                },
                buttonText: "Помочь ребенку")
            cellVMs.append(cellVM)
        }
        
        if let imageUrl = viewModel?.kidImageUrl {
            tableViewModel?.imageUrl = imageUrl
        }
        
        tableViewModel?.onChangeAlpha = { [weak self] alpha in
            self?.configureNavBarBackgroundWithColor(alpha: alpha)
        }
        tableViewModel?.setNewItems([cellVMs])
    }
}
