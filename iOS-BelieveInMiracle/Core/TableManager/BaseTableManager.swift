import UIKit

class BaseTableManager: NSObject, TableManagerable, TableManagerApendable, UITableViewDataSource, UITableViewDelegate {
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.sectionHeaderHeight = UITableViewAutomaticDimension
        }
    }
    weak var scrollViewDelegate: UIScrollViewDelegate?
    
    var items: [[CellViewModel]] = []
    var sections: [CellViewModel] = []
    
    
    func setNewItems(_ items: [[CellViewModel]]) {
        setNewItems(items, sections: [])
    }
    
    func setNewItems(
        _ items: [[CellViewModel]],
        sections: [CellViewModel]) {
        
        self.items = items
        self.sections = sections
        
        tableView?.reloadData()
    }
    
    func appendItems(items: [CellViewModel]) {
        appendItems(items: items, section: nil)
    }
    
    func appendItems(items: [CellViewModel], section: Int?) {
        let section = self.sections.count - 1
        guard self.items.count < section else {
            assertionFailure("section not found")
            return
        }
        let startRange = self.items[section].count
        self.items[section].append(contentsOf: items)
        let endRange = self.items[section].count
        let indexPaths = (startRange..<endRange).map { IndexPath(row: $0, section: section) }
        tableView?.reloadRows(at: indexPaths, with: .none)
    }
    
    func appendItems(_ items: [[CellViewModel]]) {
        appendItems(items, sections: [])
    }
    
    func appendItems(
        _ items: [[CellViewModel]],
        sections: [CellViewModel]) {
        
        let startRange = self.items.count
        self.items.append(contentsOf: items)
        let endRange = self.items.count
        self.sections.append(contentsOf: sections)
        let indexSet = IndexSet(integersIn: (startRange..<endRange))
        tableView?.reloadSections(indexSet, with: .none)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withModel: items[indexPath.section][indexPath.row], for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard sections.count > section else {
            return nil
        }
        return tableView.dequeueReusableHeaderFooterView(withModel: sections[section])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let items = items[indexPath.section][indexPath.row] as? CellViewModelHeightable else {
            return UITableViewAutomaticDimension
        }
        return items.height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard sections.count > section, let sections = sections[section] as? CellViewModelHeightable else {
            return UITableViewAutomaticDimension
        }
        return sections.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = items[indexPath.section][indexPath.row] as? CellViewModelActionable else { return }
        item.onClickOnAnyModel()
    }
    
}

// MARK: - UIScrollViewDelegate

extension BaseTableManager {
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        scrollViewDelegate?.scrollViewWillEndDragging?(
            scrollView, withVelocity: velocity,
            targetContentOffset: targetContentOffset
        )
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidScroll?(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewDelegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
}
