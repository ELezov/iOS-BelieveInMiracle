import UIKit

protocol CellViewModelActionable {
    func onClickOnAnyModel()
}

protocol CellViewModelActionableFasseles: CellViewModelActionable {
    var onClick: ((Self) -> Void)? { get set }
}

extension CellViewModelActionableFasseles {
    func onClickOnAnyModel() {
        onClick?(self)
    }
}
