import UIKit

/**
 Перечисление стилей шрифтов, используемых в приложении.
 */
// swiftlint:disable identifier_name
enum FontStyle {
    case h1
    case h2
    case h3
    case main1
    case main2
    case main3
    case main4
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
        case .h1,
             .h2,
             .main1,
             .main2,
             .input:
            return Color.Default.black
        case .main3,
             .main4:
            return Color.Default.warmGray
        case .h3,
             .tabbarInactive:
            return Color.Default.greyish
        case .card,
             .buttonText:
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
            return UIFont.systemFont(ofSize: 32)
        case .h2:
            return UIFont.systemFont(ofSize: 14)
        case .h3:
            return UIFont.systemFont(ofSize: 12)
        case .main1:
            return UIFont.systemFont(ofSize: 20)
        case .main2:
            return UIFont.systemFont(ofSize: 16)
        case .main3:
            return UIFont.systemFont(ofSize: 16)
        case .main4:
            return UIFont.systemFont(ofSize: 12)
        case .input:
            return UIFont.systemFont(ofSize: 12)
        case .buttonText:
            return UIFont.systemFont(ofSize: 16)
        case .tabbarActive:
            return UIFont.systemFont(ofSize: 10)
        case .tabbarInactive:
            return UIFont.systemFont(ofSize: 10)
        case .card:
            // TODO: fix
            return FontFamily.Corbel.regular.font(size: 10)

        case .system:
            return UIFont.systemFont(ofSize: UIFont.systemFontSize)
        }
    }
}
