//
//  UIView + LoadFromNib.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

// MARK: - Раширение UIView класс, позволяющее загружать UIView из *.xib
extension UIView {
    
    ///  Метод для загрузки view из nib файла.
    ///
    ///  - returns: загруженная view с провешенными properties
    class func loadFromNib() -> Self? {
        let selfClass: AnyClass = self as AnyClass
        var className: String = NSStringFromClass(selfClass)
        let bundle = Bundle(for: selfClass)
        if bundle.path(forResource: className, ofType: "nib") == nil {
            className = (className as NSString).pathExtension
            if bundle.path(forResource: className, ofType: "nib") == nil {
                return nil
            }
        }
        return view(bundle, className: className)
    }
    
    private class func view<T>(_ bundle: Bundle, className: String) -> T? {
        guard let nibContents = bundle.loadNibNamed(className, owner: nil, options: nil) else { return nil }
        var view: UIView?
        for obj in nibContents {
            if (obj as AnyObject).isKind(of: self) {
                view = obj as? UIView
                break
            }
        }
        return view as? T
    }
}
