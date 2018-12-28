// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
internal typealias AssetType = ImageAsset

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Common {
    internal enum ICard {
      internal static let americanExpressIcon = ImageAsset(name: "americanExpressIcon")
      internal static let bitcoinIcon = ImageAsset(name: "bitcoinIcon")
      internal static let bluePayIcon = ImageAsset(name: "bluePayIcon")
      internal static let cvsIcon = ImageAsset(name: "cVSIcon")
      internal static let chip1 = ImageAsset(name: "chip1")
      internal static let chip2 = ImageAsset(name: "chip2")
      internal static let chip3 = ImageAsset(name: "chip3")
      internal static let cirrusIcon = ImageAsset(name: "cirrusIcon")
      internal static let citiIcon = ImageAsset(name: "citiIcon")
      internal static let clickBank = ImageAsset(name: "clickBank")
      internal static let creditCardBackground = ImageAsset(name: "creditCardBackground")
      internal static let googleWalletIcon = ImageAsset(name: "googleWalletIcon")
      internal static let hsbcIcon = ImageAsset(name: "hsbcIcon")
      internal static let kredikartTaslak = ImageAsset(name: "kredikartTaslak")
      internal static let maestro2Icon = ImageAsset(name: "maestro2Icon")
      internal static let maestroIcon = ImageAsset(name: "maestroIcon")
      internal static let masterCard = ImageAsset(name: "masterCard")
      internal static let masterCardDetail = ImageAsset(name: "masterCardDetail")
      internal static let masterCardMini = ImageAsset(name: "masterCardMini")
      internal static let moneygramIcon = ImageAsset(name: "moneygramIcon")
      internal static let paypal2Icon = ImageAsset(name: "paypal2Icon")
      internal static let paypalIcon = ImageAsset(name: "paypalIcon")
      internal static let simpleBackgroundImage = ImageAsset(name: "simpleBackgroundImage")
      internal static let visaIcon = ImageAsset(name: "visaIcon")
      internal static let visaIconBigger = ImageAsset(name: "visaIconBigger")
      internal static let visaIconText = ImageAsset(name: "visaIconText")
      internal static let wepayIcon = ImageAsset(name: "wepayIcon")
      internal static let westernUnionIcon = ImageAsset(name: "westernUnionIcon")
    }
    internal static let indicator = ImageAsset(name: "indicator")
  }
  internal enum Donate {
    internal static let card = ImageAsset(name: "card")
    internal enum Payment {
      internal static let maestro = ImageAsset(name: "maestro")
      internal static let mastercard = ImageAsset(name: "mastercard")
      internal static let mir = ImageAsset(name: "mir")
      internal static let visa = ImageAsset(name: "visa")
    }
    internal static let phone = ImageAsset(name: "phone")
  }
  internal enum TabBar {
    internal static let info = ImageAsset(name: "info")
    internal static let kids = ImageAsset(name: "kids")
    internal static let money = ImageAsset(name: "money")
    internal static let volonteer = ImageAsset(name: "volonteer")
  }
  internal enum Volunteer {
    internal static let adressVolunteer = ImageAsset(name: "adress_volunteer")
    internal static let arrow = ImageAsset(name: "arrow")
    internal static let clownTherapy = ImageAsset(name: "clown_therapy")
    internal static let distanceVolunteer = ImageAsset(name: "distance_volunteer")
    internal static let eventVolunteer = ImageAsset(name: "event_volunteer")
    internal static let help = ImageAsset(name: "help")
    internal static let hospitalVolunteer = ImageAsset(name: "hospital_volunteer")
  }
  internal static let facebook = ImageAsset(name: "facebook")
  internal static let icAttachMoneyBlack24dp = ImageAsset(name: "ic_attach_money_black_24dp")
  internal static let icChildCareBlack24dp = ImageAsset(name: "ic_child_care_black_24dp")
  internal static let icInfoBlack24dp = ImageAsset(name: "ic_info_black_24dp")
  internal static let icPersonBlack24dp = ImageAsset(name: "ic_person_black_24dp")
  internal static let insta = ImageAsset(name: "insta")
  internal static let mainLogo = ImageAsset(name: "main_logo")
  internal static let vk = ImageAsset(name: "vk")
  internal static let web = ImageAsset(name: "web")
  internal static let whiteLogo = ImageAsset(name: "white_logo")

  // swiftlint:disable trailing_comma
  internal static let allColors: [ColorAsset] = [
  ]
  internal static let allImages: [ImageAsset] = [
    Common.ICard.americanExpressIcon,
    Common.ICard.bitcoinIcon,
    Common.ICard.bluePayIcon,
    Common.ICard.cvsIcon,
    Common.ICard.chip1,
    Common.ICard.chip2,
    Common.ICard.chip3,
    Common.ICard.cirrusIcon,
    Common.ICard.citiIcon,
    Common.ICard.clickBank,
    Common.ICard.creditCardBackground,
    Common.ICard.googleWalletIcon,
    Common.ICard.hsbcIcon,
    Common.ICard.kredikartTaslak,
    Common.ICard.maestro2Icon,
    Common.ICard.maestroIcon,
    Common.ICard.masterCard,
    Common.ICard.masterCardDetail,
    Common.ICard.masterCardMini,
    Common.ICard.moneygramIcon,
    Common.ICard.paypal2Icon,
    Common.ICard.paypalIcon,
    Common.ICard.simpleBackgroundImage,
    Common.ICard.visaIcon,
    Common.ICard.visaIconBigger,
    Common.ICard.visaIconText,
    Common.ICard.wepayIcon,
    Common.ICard.westernUnionIcon,
    Common.indicator,
    Donate.card,
    Donate.Payment.maestro,
    Donate.Payment.mastercard,
    Donate.Payment.mir,
    Donate.Payment.visa,
    Donate.phone,
    TabBar.info,
    TabBar.kids,
    TabBar.money,
    TabBar.volonteer,
    Volunteer.adressVolunteer,
    Volunteer.arrow,
    Volunteer.clownTherapy,
    Volunteer.distanceVolunteer,
    Volunteer.eventVolunteer,
    Volunteer.help,
    Volunteer.hospitalVolunteer,
    facebook,
    icAttachMoneyBlack24dp,
    icChildCareBlack24dp,
    icInfoBlack24dp,
    icPersonBlack24dp,
    insta,
    mainLogo,
    vk,
    web,
    whiteLogo,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  internal static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

internal extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
