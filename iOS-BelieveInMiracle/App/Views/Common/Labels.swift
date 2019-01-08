//
//  Labels.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

/**
 Описание классов лейблов, соответстующих стилям шрифтов.
 */

@IBDesignable
class LabelH1: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.initFrom(style: .h1)
    }
}

@IBDesignable
class LabelH2: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.initFrom(style: .h2)
    }
}

@IBDesignable
class LabelTitle1: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.initFrom(style: .title1)
    }
}

@IBDesignable
class LabelSubtitle1: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.initFrom(style: .subtitle1)
    }
}

@IBDesignable
class LabelSubtitle2: BaseLabel {
    override class func font() -> UIFont {
        return UIFont.initFrom(style: .subtitle2)
    }
}
