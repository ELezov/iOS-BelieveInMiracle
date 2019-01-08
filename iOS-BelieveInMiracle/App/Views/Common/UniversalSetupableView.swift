//
//  UniversalSetupableView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

@IBDesignable
class UniversalSetupableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
        setupConstraints()
    }
    
    func configure() {
        assertionFailure("should override in children")
    }
    
    func setupConstraints() {
        assertionFailure("should override in children")
    }
}
