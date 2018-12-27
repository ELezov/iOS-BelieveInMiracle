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

      internal enum Request {
        /// Отправить заявку
        internal static let send = L10n.tr("Localizable", "common.button.request.send")
      }
    }
  }

  internal enum Donate {
    /// Оплата банковской картой
    internal static let card = L10n.tr("Localizable", "donate.card")
    /// Отправить SMS
    internal static let sms = L10n.tr("Localizable", "donate.sms")

    internal enum Card {
      /// Перечислить пожертвование с банковской карты
      internal static let instruction = L10n.tr("Localizable", "donate.card.instruction")
    }

    internal enum Payment {
      /// Введите имя владельца карты
      internal static let enterCardHolder = L10n.tr("Localizable", "donate.payment.enterCardHolder")
      /// Введите номер карты
      internal static let enterCardNumber = L10n.tr("Localizable", "donate.payment.enterCardNumber")
      /// Введите корректный номер карты
      internal static let enterCorrectCardNumber = L10n.tr("Localizable", "donate.payment.enterCorrectCardNumber")
      /// Введите CVV код
      internal static let enterCVVCode = L10n.tr("Localizable", "donate.payment.enterCVVCode")
      /// Введите дату окончания действия карты в формате MM/YY
      internal static let enterExpirationDate = L10n.tr("Localizable", "donate.payment.enterExpirationDate")
      /// Ошибка при создании крипто-пакета
      internal static let errorCreatingCryptoPacket = L10n.tr("Localizable", "donate.payment.errorCreatingCryptoPacket")
      /// Ошибка
      internal static let errorWord = L10n.tr("Localizable", "donate.payment.errorWord")
      /// Информация
      internal static let informationWord = L10n.tr("Localizable", "donate.payment.informationWord")
    }

    internal enum Sms {
      /// Cообщение на короткий номер 7715 со словом ВЕРИМ (пробел) ваша сумма
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

    internal enum Request {
      /// email
      internal static let mail = L10n.tr("Localizable", "volunteer.request.mail")
      /// Имя
      internal static let name = L10n.tr("Localizable", "volunteer.request.name")
      /// Телефон
      internal static let phone = L10n.tr("Localizable", "volunteer.request.phone")
      /// Новая заявка в волонтеры через мобильное приложение
      internal static let title = L10n.tr("Localizable", "volunteer.request.title")

      internal enum Question {
        /// Укажите ваш mail
        internal static let mail = L10n.tr("Localizable", "volunteer.request.question.mail")
        /// Как вас зовут?
        internal static let name = L10n.tr("Localizable", "volunteer.request.question.name")
        /// Контактный номер:
        internal static let phone = L10n.tr("Localizable", "volunteer.request.question.phone")
      }

      internal enum Send {
        /// Произошла ошибка, попробуйте позже
        internal static let failure = L10n.tr("Localizable", "volunteer.request.send.failure")
        /// Заявка успешно отправлена
        internal static let success = L10n.tr("Localizable", "volunteer.request.send.success")
      }
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
