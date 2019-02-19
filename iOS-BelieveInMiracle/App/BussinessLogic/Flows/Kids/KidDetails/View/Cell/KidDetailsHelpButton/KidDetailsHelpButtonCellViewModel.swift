//
//  KidDetailsHelpButtonCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct KidDetailsHelpButtonCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    var onClick: EmptyCompletion?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let buttonText: String
    
    func setup(cell: KidDetailsHelpButtonCellView) {
        cell.button.setTitle(buttonText, for: .normal)
        cell.onClick = onClick
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
