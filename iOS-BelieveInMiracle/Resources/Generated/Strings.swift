// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum Common {

    internal enum Button {
      /// Продолжить
      internal static let `continue` = L10n.tr("Localizable", "common.button.continue")
    }
  }

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

  internal enum Volunteer {

    internal enum Adressvolunteer {
      /// Поздравления подопечных детей с днем рождения, новым годом и другими праздниками, занятия с детьми в паллиативном статусе (находящимся дома) после прохождения специализированного обучения. 
      internal static let description = L10n.tr("Localizable", "volunteer.adressVolunteer.description")
      /// Адресные волонтеры
      internal static let title = L10n.tr("Localizable", "volunteer.adressVolunteer.title")
    }

    internal enum Clowntherapy {
      /// Стать больничным клоуном. Это НЕ аниматор. Это партнер по радости, душевный специалист, друг для всей семьи. 
      internal static let description = L10n.tr("Localizable", "volunteer.clownTherapy.description")
      /// Клоунотерапия
      internal static let title = L10n.tr("Localizable", "volunteer.clownTherapy.title")
    }

    internal enum Distancevolunteer {
      /// Если вы профессионал своего дела (неважно - юрист, документовед, фотограф, представитель любой другой профессии) и готовы с удобной для себя загруженностью помочь PRO BONO, мы ждем вашей заявки.
      internal static let description = L10n.tr("Localizable", "volunteer.distanceVolunteer.description")
      /// Дистанционные волонтеры
      internal static let title = L10n.tr("Localizable", "volunteer.distanceVolunteer.title")
    }

    internal enum Eventvolunteer {
      /// Организаторы и помощники на мероприятиях «Верю в чудо» в поддержку тяжелоболеющих детей, благотворительных ярмарках, на мероприятиях для подопечных детей. 
      internal static let description = L10n.tr("Localizable", "volunteer.eventVolunteer.description")
      /// Волонтеры мероприятий
      internal static let title = L10n.tr("Localizable", "volunteer.eventVolunteer.title")
    }

    internal enum Hospitalvolunteer {
      /// Работа с детьми, находящимися на лечении в региональных ЛПУ: творческие занятия и мастер-классы, педгогические и психологические занятия (при наличии компетенций и потребности у ребенка или родителя), модернизация больничной инфраструктуры детских лечебно - профилактических учреждений.
      internal static let description = L10n.tr("Localizable", "volunteer.hospitalVolunteer.description")
      /// Больничные волонтеры
      internal static let title = L10n.tr("Localizable", "volunteer.hospitalVolunteer.title")
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
