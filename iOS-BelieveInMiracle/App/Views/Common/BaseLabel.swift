//
//  BaseLabel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

@IBDesignable
open class BaseLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareAppearance()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareAppearance()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        prepareAppearance()
    }
    
    final func prepareAppearance() {
        font = type(of: self).font()
    }
    
    open class func font() -> UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
}
