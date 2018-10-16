import UIKit

protocol TableManagerable: class {
    var tableView: UITableView? { get set }
    var items: [[CellViewModel]] { get }
    var sections: [CellViewModel] { get }
    var scrollViewDelegate: UIScrollViewDelegate? { get set }
    
    func setNewItems(_ items: [[CellViewModel]])
    func setNewItems(_ items: [[CellViewModel]], sections: [CellViewModel])
}

protocol TableManagerApendable: class {
    var tableView: UITableView? { get set }
    var items: [[CellViewModel]] { get }
    var sections: [CellViewModel] { get }
    
    func appendItems(items: [CellViewModel])
    func appendItems(items: [CellViewModel], section: Int?)
    func appendItems(_ items: [[CellViewModel]])
    func appendItems(
        _ items: [[CellViewModel]],
        sections: [CellViewModel])
}
