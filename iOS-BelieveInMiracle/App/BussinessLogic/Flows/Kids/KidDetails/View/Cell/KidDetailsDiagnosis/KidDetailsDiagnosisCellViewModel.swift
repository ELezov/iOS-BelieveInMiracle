//
//  KidDetailsDiagnosisCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct KidDetailsDiagnosisCellViewModel:
    CellViewModelFaceless,
    CellViewModelHeightable,
CellViewModelActionableFasseles {
    var onClick: ((KidDetailsDiagnosisCellViewModel) -> Void)?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let diagnosis: String
    
    func setup(cell: KidDetailsDiagnosisCellView) {
        cell.lDiagnosis.text = diagnosis
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
