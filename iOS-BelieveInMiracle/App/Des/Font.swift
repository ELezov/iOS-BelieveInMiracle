import UIKit

/**
 Перечисление стилей шрифтов, используемых в приложении.
 */
// swiftlint:disable identifier_name
enum FontStyle {
    case h1
    case h2
    case title1
    case subtitle1
    case subtitle2
    case button
    case buttonColored
    case body1
    case body2
    case caption
}

extension FontStyle {
    func style() -> Font {
        let font = fontStyle()
        return font
    }
}

// swiftlint:disable cyclomatic_complexity
fileprivate extension FontStyle {
    func fontStyle() -> Font {
        switch self {
        case .h1:
            return FontFamily.Corbel.regular.font(size: 15)
        case .h2:
            return FontFamily.Corbel.regular.font(size: 20)
        case .title1:
            return FontFamily.Corbel.bold.font(size: 16)
        case .subtitle1:
            return FontFamily.Corbel.regular.font(size: 12)
        case .subtitle2:
            return FontFamily.Corbel.regular.font(size: 16)
        case .button:
            return FontFamily.Corbel.regular.font(size: 15)
        case .buttonColored:
            return FontFamily.Corbel.regular.font(size: 15)
        case .body1:
            return FontFamily.Corbel.bold.font(size: 17)
        case .body2:
            return FontFamily.Corbel.regular.font(size: 15)
        case .caption:
            return FontFamily.Corbel.regular.font(size: 15)
        }
    }
}
