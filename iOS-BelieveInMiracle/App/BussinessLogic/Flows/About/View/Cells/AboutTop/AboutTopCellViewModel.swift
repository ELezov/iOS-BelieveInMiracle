//
//  AboutTopCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct AboutTopCellViewModel:
    CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let description: String
    
    func setup(cell: AboutTopCellView) {
        cell.lDescription.text = description
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
