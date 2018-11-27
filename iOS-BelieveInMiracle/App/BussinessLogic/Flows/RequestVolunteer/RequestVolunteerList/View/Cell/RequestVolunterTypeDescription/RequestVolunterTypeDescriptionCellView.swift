//
//  RequestVolunterTypeDescriptionCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 31.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
//swiftlint:disable private_outlet
class RequestVolunterTypeDescriptionCellView: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = FontStyle.subtitle2.style()
        }
    }
    
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = UIColor(Color.separator)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
