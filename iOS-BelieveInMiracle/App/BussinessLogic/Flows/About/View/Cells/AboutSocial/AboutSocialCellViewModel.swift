//
//  AboutSocialCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

struct AboutSocialCellViewModel:
    CellViewModelFaceless,
CellViewModelHeightable {
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    var onSocial: SocialTypeCompletion
    
    func setup(cell: AboutSocialCellView) {
        cell.onSocial = onSocial
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
