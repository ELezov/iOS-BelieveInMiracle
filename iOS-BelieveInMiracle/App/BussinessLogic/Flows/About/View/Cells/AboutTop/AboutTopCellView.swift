//
//  AboutTopCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutTopCellView: BaseCell {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var ivLogo: UIImageView! {
        didSet {
            ivLogo.image = Asset.mainLogo.image
            ivLogo.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var lDescription: LabelMain1!
    
}
