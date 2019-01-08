//
//  AboutProgrammsCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct ProgrammItemModel {
    let img: UIImage
    let description: String
}

struct AboutProgrammsCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let programms: [ProgrammItemModel]
    
    func setup(cell: AboutProgrammsCellView) {
        cell.configureScrollView(models: programms)
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
