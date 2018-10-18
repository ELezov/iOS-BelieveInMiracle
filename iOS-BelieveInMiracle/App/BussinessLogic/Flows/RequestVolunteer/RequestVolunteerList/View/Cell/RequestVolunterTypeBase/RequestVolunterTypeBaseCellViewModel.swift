//
//  RequestVolunterTypeBaseCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

struct RequestVolunterTypeBaseCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable,
CellViewModelActionableFasseles {
    
    typealias OnClick = (RequestVolunterTypeBaseCellViewModel) -> Void
    
    var onClick: OnClick?
    var onIndicator: EmptyCompletion?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let icon: UIImage
    let title: String
    
   func setup(cell: RequestVolunterTypeBaseCellView) {
        cell.typeIconView.image = icon
        cell.onIndicatorTapped = {
            self.onIndicator?()
        }
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }

    
}
