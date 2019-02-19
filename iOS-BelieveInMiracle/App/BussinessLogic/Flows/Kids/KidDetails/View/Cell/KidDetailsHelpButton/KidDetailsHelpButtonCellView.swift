//
//  KidDetailsHelpButtonCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable private_outlet, private_action
class KidDetailsHelpButtonCellView: BaseCell {
    
    var onClick: EmptyCompletion?

    @IBOutlet weak var button: ActionButton!
    
    @IBAction func buttonDidTapped(_ sender: Any) {
        self.onClick?()
    }
}
