import UIKit

/**
 Расширение UIColor, позволяещее создать цвет из объекта перечисления стилей.
 */
extension UIColor {
    
    static func initFrom(style: FontStyle) -> Font {
        return style.style()
    }
    
    convenience init(_ color: Color) {
        self.init(color)
    }
}
