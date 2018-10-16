import UIKit

protocol CellViewModel {
    static var cellAnyType: UIView.Type { get }
    func setupAny(cell: UIView)
}

protocol CellViewModelFaceless: CellViewModel {
    associatedtype CellType: UIView
    func setup(cell: CellType)
}

extension CellViewModelFaceless {
    static var cellAnyType: UIView.Type {
        return CellType.self
    }
    
    func setupAny(cell: UIView) {
        if let cell = cell as? CellType {
            setup(cell: cell)
        } else {
            assertionFailure("CellViewModelFaceless and be implemet UIView and subclass only")
        }
    }
}
