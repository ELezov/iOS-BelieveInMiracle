import UIKit

final class DonateVCTableBuilder: DonateVCTableBuilderAbstract {
    
    func map(_ completionSelect: @escaping DonateItemListCellViewModel.OnClick) -> [CellViewModel] {
        var result = [DonateItemListCellViewModel]()
        let smsModel = DonateItemListCellViewModel(onClick: completionSelect, donateType: .sms)
        let cardModel = DonateItemListCellViewModel(onClick: completionSelect, donateType: .card)
        result.append(smsModel)
        result.append(cardModel)
        return result
    }
}
