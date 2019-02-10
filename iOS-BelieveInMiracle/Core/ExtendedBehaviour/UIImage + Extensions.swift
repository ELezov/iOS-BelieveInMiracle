//
//  UIImage + Extensions.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 10/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable force_unwrapping
extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
