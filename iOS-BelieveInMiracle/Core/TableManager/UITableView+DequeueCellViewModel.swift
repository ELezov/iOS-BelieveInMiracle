import UIKit

extension UITableView {
    func dequeueReusableCell(withModel model: CellViewModel, for indexPath: IndexPath) -> UITableViewCell {
        let indetifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withIdentifier: indetifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
    
    func register(nibModels: [CellViewModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let bundle = Bundle(for: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: bundle)
            self.register(nib, forCellReuseIdentifier: identifier)
        }
    }
}

extension UITableView {
    func dequeueReusableHeaderFooterView(withModel model: CellViewModel) -> UITableViewHeaderFooterView? {
        let indetifier = String(describing: type(of: model).cellAnyType)
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: indetifier) else {
            return nil
        }
        model.setupAny(cell: cell)
        return cell
    }
    
    func register(nibModelsForHeaderFooter nibModels: [CellViewModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let bundle = Bundle(for: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: bundle)
            self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}
