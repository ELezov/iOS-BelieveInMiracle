//
//  RequestVolunterTypeDescriptionCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 31.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
//swiftlint:disable private_outlet
class RequestVolunterTypeDescriptionCellView: BaseCell {
    
    @IBOutlet weak var titleLabel: LabelMain2!
    
    @IBOutlet weak var heightConstraintSeparatorView: NSLayoutConstraint! {
        didSet {
            heightConstraintSeparatorView.constant = 0.5
        }
    }
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Color.Base.separator
        }
    }
    
}
