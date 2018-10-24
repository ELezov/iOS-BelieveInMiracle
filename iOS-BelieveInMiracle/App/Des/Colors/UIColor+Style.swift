import UIKit

/**
 Расширение UIColor, позволяещее создать цвет из объекта перечисления стилей.
 */
extension UIColor {
    
    convenience init(_ color: Color) {
        self.init(color)
    }
}
