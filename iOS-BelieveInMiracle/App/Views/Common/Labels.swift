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

    override class func currentStyle() -> FontStyle {
        return .h1
    }
}

@IBDesignable
class LabelH2: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .h2
    }
}

@IBDesignable
class LabelH3: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .h3
    }
}

@IBDesignable
class LabelMain1: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .main1
    }
}

@IBDesignable
class LabelMain2: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .main2
    }
}

@IBDesignable
class LabelMain3: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .main3
    }
}

@IBDesignable
class LabelMain4: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .main4
    }
}

@IBDesignable
class LabelInput: BaseLabel {

    override class func currentStyle() -> FontStyle {
        return .input
    }
}
