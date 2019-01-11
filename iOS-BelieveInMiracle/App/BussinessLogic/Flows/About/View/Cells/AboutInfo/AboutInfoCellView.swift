//
//  AboutInfoCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutInfoCellView: TableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var lTitle: LabelH2! {
        didSet {
            lTitle.text = L10n.About.We.title
        }
    }
    
    @IBOutlet private weak var lDescription: LabelMain1! {
        didSet {
            lDescription.text = L10n.About.We.description
        }
    }
}
