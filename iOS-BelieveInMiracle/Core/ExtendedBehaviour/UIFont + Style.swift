//
//  UIFont + Style.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

/**
 Расширение UIFont, позволяещее создать шрифт из объекта перечисления стилей.
 */
extension UIFont {
    static func initFrom(style: FontStyle) -> Font {
        return style.style()
    }
    
    static func initFor(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
