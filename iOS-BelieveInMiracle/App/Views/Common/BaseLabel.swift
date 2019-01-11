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
        textColor = type(of: self).currentStyle().color()
    }
    
    open class func font() -> UIFont {
        return UIFont.initFrom(style: currentStyle())
    }
    
    open class func lineSpacing() -> CGFloat {
        return currentStyle().lineSpacing()
    }
    
    class func currentStyle() -> FontStyle {
        return .h1
    }
    
}
