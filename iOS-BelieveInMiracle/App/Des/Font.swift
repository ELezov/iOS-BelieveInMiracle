import UIKit

/**
 Перечисление стилей шрифтов, используемых в приложении.
 */
// swiftlint:disable identifier_name
enum FontStyle {
    case h1
    case h2
    case h3
    case h4
    case main1
    case main2
    case main3
    case input
    case buttonText
    case tabbarActive
    case tabbarInactive
    case card
    
    case system
}

extension FontStyle {
    func color() -> UIColor {
        switch self {
        case .h1, .main2, .main3:
            return Color.Default.warmGray
        case .h2, .h3, .main1, .input:
            return Color.Default.black
        case .h4, .tabbarInactive:
            return Color.Default.greyish
        case .buttonText:
            return Color.Base.white
        case .tabbarActive:
            return Color.Default.brightBlue
        default:
            return UIColor.red
        }
    }
}

extension FontStyle {
    func style() -> Font {
        let font = fontStyle()
        return font
    }
    
    func lineSpacing() -> CGFloat {
        switch self {
        case .h1:
            return 24
        case .h2:
            return 24
        case .h3:
            return 24
        case .h4:
            return 14
        case .main1:
            return 24
        case .main2:
            return 14
        case .main3:
            return 24
        case .input:
            return 14
        case .buttonText:
            return 18
        case .tabbarInactive:
            return 12
        case .tabbarActive:
            return 12
        case .card:
            return 24
        default:
            return 24
        }
    }
}

// swiftlint:disable cyclomatic_complexity
fileprivate extension FontStyle {
    func fontStyle() -> Font {
        switch self {
        case .h1:
            return FontFamily.Corbel.regular.font(size: 20)
        case .h2:
            return FontFamily.Corbel.bold.font(size: 16)
        case .h3:
            return FontFamily.Corbel.bold.font(size: 14)
        case .h4:
            return FontFamily.Corbel.regular.font(size: 12)
        case .main1:
            return FontFamily.Corbel.regular.font(size: 16)
        case .main2:
            return FontFamily.Corbel.regular.font(size: 12)
        case .main3:
            return FontFamily.Corbel.italic.font(size: 16)
        case .input:
            return FontFamily.Corbel.bold.font(size: 12)
        case .buttonText:
            return FontFamily.Corbel.regular.font(size: 16)
        case .tabbarActive:
            return FontFamily.Corbel.regular.font(size: 10)
        case .tabbarInactive:
            return FontFamily.Corbel.regular.font(size: 10)
        case .card:
            // TODO: fix
            return FontFamily.Corbel.regular.font(size: 10)
            
        case .system:
            return UIFont.systemFont(ofSize: UIFont.systemFontSize)
        }
    }
}
