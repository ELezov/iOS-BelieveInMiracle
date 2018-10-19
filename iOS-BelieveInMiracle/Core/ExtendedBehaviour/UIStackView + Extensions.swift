//
//  UIStackView + Extension.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

extension UIStackView {

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
            removeArrangedSubview($0)
        }
    }
    
}
