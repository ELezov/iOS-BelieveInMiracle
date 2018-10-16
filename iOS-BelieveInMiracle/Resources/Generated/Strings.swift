// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Donate {
    /// Оплата банковской картой
    internal static let card = L10n.tr("Localizable", "donate.card")
    /// Отправить SMS
    internal static let sms = L10n.tr("Localizable", "donate.sms")

    internal enum Sms {
      /// на короткий номер со словом ВЕРИМ (пробел) ваша сумма
      internal static let instruction = L10n.tr("Localizable", "donate.sms.instruction")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
