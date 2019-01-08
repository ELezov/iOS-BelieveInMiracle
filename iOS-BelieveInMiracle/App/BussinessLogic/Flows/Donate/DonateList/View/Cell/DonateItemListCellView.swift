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

    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var titleLabel: LabelTitle1! {
        didSet {
            titleLabel.textColor = UIColor(Color.Base.primaryDark)
        }
    }
    @IBOutlet weak var descriptionLabel: LabelSubtitle1! {
        didSet {
            
            descriptionLabel.textColor = UIColor(Color.Text.primaryLight)
        }
    }
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = UIColor(Color.Base.separator)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}
