//
//  KidsListItemCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit
import Kingfisher

//swiftlint:disable private_outlet
class KidsListItemCellView: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lName: LabelH3!
    @IBOutlet weak var lDiagnoz: LabelMain2!
    @IBOutlet weak var lAge: LabelH4!
    @IBOutlet weak var lBalance: LabelMain1!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
