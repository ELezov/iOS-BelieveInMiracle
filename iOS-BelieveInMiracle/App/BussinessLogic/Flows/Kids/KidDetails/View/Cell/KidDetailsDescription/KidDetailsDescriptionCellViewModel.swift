//
//  KidDetailsDescriptionCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

struct KidDetailsDescriptionCellViewModel:
    CellViewModelFaceless,
    CellViewModelHeightable,
CellViewModelActionableFasseles {
    var onClick: ((KidDetailsDescriptionCellViewModel) -> Void)?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let descriptionText: String
    
    func setup(cell: KidDetailsDescriptionCellView) {
        cell.lDescription.attributedText = setHTML(html: descriptionText)
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
    
    func setHTML(html: String) -> NSAttributedString? {
        do {
            let attributedString: NSAttributedString = try NSAttributedString(
                data: html.data(using: .utf8)!,
                options:
    [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
     NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
            return attributedString
        } catch {
            return nil
        }
    }
}
