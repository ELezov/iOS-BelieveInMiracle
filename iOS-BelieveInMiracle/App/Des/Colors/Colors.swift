import UIKit

/**
 Перечисление цветов, используемых в приложении.
 */
enum Color {
    
    static let primaryLight = "#4FC3F7"
    static let primaryDark = "#039BE5"
    static let secondaryLight = "#FFA726"
    static let secondaryDark = "#FB8C00"
    
    static let textPrimaryDark = "#424242"
    static let textPrimaryLight = "#616161"
    static let textPrimaryInverse = "#FFFFFF"
    
    static let backgroundDark = "#BDBDBD"
    static let backgroundLight = "#E0E0E0"
    
    func color() -> UIColor {
        return UIColor(self)
    }
}
