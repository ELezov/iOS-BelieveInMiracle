//
//  DonateItemListCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 16.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable private_outlet
class DonateItemListCellView: BaseCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var heightConstraintSeparatorView: NSLayoutConstraint! {
        didSet {
            heightConstraintSeparatorView.constant = 0.5
        }
    }
    

    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var titleLabel: LabelH2!
    @IBOutlet weak var descriptionLabel: LabelMain4!
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Color.Base.separator
        }
    }
    
}
