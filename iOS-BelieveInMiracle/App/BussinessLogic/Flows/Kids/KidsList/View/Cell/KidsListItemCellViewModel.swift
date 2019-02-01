//
//  KidsListItemCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct KidsListItemCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = 120
    
    let height: CGFloat = cellHeight
    
    let kid: Kid
    
    func setup(cell: KidsListItemCellView) {
        cell.ivPhoto.image = nil
        cell.lName.text = kid.fullName
        cell.lDiagnoz.text = kid.diagnoz
        cell.lAge.text = kid.ageString
        cell.lBalance.text = kid.balanceString
        guard let url = URL(string: kid.image?
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        else { return }
        cell.ivPhoto.kf.setImage(with: url)
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
