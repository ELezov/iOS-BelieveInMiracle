//
//  KidDetailsNameCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct KidDetailsNameCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable,
CellViewModelActionableFasseles {
    var onClick: ((KidDetailsNameCellViewModel) -> Void)?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let fullName: String
    
    func setup(cell: KidDetailsNameCellView) {
        cell.lName.text = fullName
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
