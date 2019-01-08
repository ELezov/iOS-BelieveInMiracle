import UIKit

/**
 Перечисление цветов, используемых в приложении.
 */
enum Color {
    
    enum Base {
        static let primaryLight = "#b3e1f7"
        static let primaryDark = "#007AFF"
        static let secondaryLight = "#FFA726"
        static let secondaryDark = "#FB8C00"
        static let backgroundDark = "#BDBDBD"
        static let backgroundLight = "#E0E0E0"
        static let separator = "#E0E0E0"
        static let white = "#FFFFFF"
    }
    
    enum Text {
        static let primaryDark = "#424242"
        static let primaryLight = "#616161"
        static let primaryInverse = Color.Base.white
    }
    
    func color() -> UIColor {
        return UIColor(self)
    }
}
