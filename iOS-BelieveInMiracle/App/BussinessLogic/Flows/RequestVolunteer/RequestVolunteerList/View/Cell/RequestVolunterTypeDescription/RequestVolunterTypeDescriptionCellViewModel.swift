//
//  RequestVolunterTypeDescriptionCellViewModel.swift.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 01.11.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

struct RequestVolunterTypeDescriptionCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let description: String
    
    func setup(cell: RequestVolunterTypeDescriptionCellView) {
       cell.titleLabel.text = description
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
