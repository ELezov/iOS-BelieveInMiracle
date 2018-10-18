import UIKit

struct DonateItemListCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable,
CellViewModelActionableFasseles {
    
    enum DonateItemType {
        case sms
        case card
    }
    
    typealias OnClick = (DonateItemListCellViewModel) -> Void
    
    var onClick: OnClick?
    
    static let cellHeight: CGFloat = 120
    
    let height: CGFloat = cellHeight
    
    let donateType: DonateItemType
    
    func setup(cell: DonateItemListCellView) {
        cell.iconImageView.image = imageForDonate()
        cell.titleLabel.text = titleForDonate()
        if let descriptionText = descriptionForDonate() {
            cell.descriptionLabel.isHidden = false
            cell.descriptionLabel.text = descriptionText
        } else {
            cell.descriptionLabel.isHidden = true
        }
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
    
    // Configure
    
    func imageForDonate() -> Image {
        switch donateType {
        case .card:
            return Asset.Donate.card.image
        case .sms:
             return Asset.Donate.phone.image
        }
    }
    
    func titleForDonate() -> String? {
        switch donateType {
        case .card:
            return L10n.Donate.card
        case .sms:
            return L10n.Donate.sms
        }
    }
    
    func descriptionForDonate() -> String? {
        guard donateType == .sms else { return nil }
        return L10n.Donate.Sms.instruction
            
    }
}
