//
//  AboutInfoCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutInfoCellView: BaseCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var lTitle: LabelMain2! {
        didSet {
            lTitle.text = L10n.About.We.title
        }
    }
    
    @IBOutlet private weak var lDescription: LabelMain2! {
        didSet {
            lDescription.text = L10n.About.We.description
        }
    }
}
