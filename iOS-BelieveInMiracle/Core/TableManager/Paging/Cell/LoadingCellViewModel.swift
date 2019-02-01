//
//  LoadingCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 12/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct LoadingCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = 60
    
    let height: CGFloat = cellHeight
    
    func setup(cell: LoadingCellView) {
        cell.indicatorView.startAnimating()
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
