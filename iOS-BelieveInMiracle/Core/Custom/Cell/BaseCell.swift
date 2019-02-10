//
//  BaseCell.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 10/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
