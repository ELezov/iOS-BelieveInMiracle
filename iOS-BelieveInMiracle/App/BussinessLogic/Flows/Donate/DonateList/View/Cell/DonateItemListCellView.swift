//
//  DonateItemListCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 16.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable private_outlet
class DonateItemListCellView: UITableViewCell {
    
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
    @IBOutlet weak var titleLabel: LabelH3!
    @IBOutlet weak var descriptionLabel: LabelMain2!
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Color.Base.separator
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}
