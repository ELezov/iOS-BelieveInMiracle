//
//  AppProductionCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by EugenKGD on 11/03/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

struct AppProductionCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    let appVersion: String
    
    func setup(cell: AppProductionCellView) {
        cell.appVersion = appVersion
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
