import UIKit

/**
 Перечисление цветов, используемых в приложении.
 */
enum Color {
    
    enum Default {
        static let brightBlue = UIColor(red: 0, green: 122, blue: 255)
        static let skyBlue = UIColor(red: 126, green: 187, blue: 255)
        static let black = UIColor(red: 55, green: 55, blue: 55)
        static let warmGray = UIColor(red: 112, green: 112, blue: 112)
        static let greyish = UIColor(red: 163, green: 163, blue: 163)
        static let background = UIColor(red: 247, green: 247, blue: 247)
    }
    
    enum Base {
        static let primaryLight = Default.skyBlue
        static let primaryDark = Default.brightBlue
        static let separator = Default.greyish
        static let white = UIColor.white
    }
    
    enum Text {
        static let primaryDark = Default.black
        static let primaryLight = Base.white
        static let primaryInverse = Base.white
    }
}
