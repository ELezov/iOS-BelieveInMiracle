//
//  AboutInfoCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

struct AboutInfoCellViewModel:
    CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    func setup(cell: AboutInfoCellView) {
        
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
