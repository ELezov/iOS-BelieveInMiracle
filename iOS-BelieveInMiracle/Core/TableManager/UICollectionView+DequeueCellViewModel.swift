import UIKit

extension UICollectionView {

    func dequeueReusableCell(withModel model: CellViewModel, for indexPath: IndexPath) -> UICollectionViewCell {
        let indetifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withReuseIdentifier: indetifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
    
    func register(nibModels: [CellViewModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let bundle = Bundle(for: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: bundle)
            self.register(nib, forCellWithReuseIdentifier: identifier)
        }
    }
    
    func register(models: [CellViewModel.Type]) {
        for model in models {
            let identifier = String(describing: model.cellAnyType)
            self.register(model.cellAnyType, forCellWithReuseIdentifier: identifier)
        }
    }
}
