//
//  Kid.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation


struct Kid {
    
    enum KidStatus: String {
        case helped
        case needHelp = "needhelp"
        case undefined
    }
    
    let fullName: String?
    let diagnoz: String?
    let needMoney: String?
    let saveMoney: String?
    let remaindMoney: String?
    let bithday: String?
    let dieday: String?
    let city: String?
    let descriptionText: String?
    let status: String?
    let kidStatus: KidStatus
    let image: String?
    let linkHelp: String?
    
    var ageString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let birthDayString = bithday,
            let date = dateFormatter.date(from: birthDayString) else {
            return ""
        }
        let ageComponents = Calendar.current.dateComponents(
            [Calendar.Component.month, Calendar.Component.year],
            from: date,
            to: Date()
        )
        if let year = ageComponents.year, year != 0 {
            return "\(year) лет"
        }
        
        let months = ageComponents.month ?? 0
        return "\(months) месяцев"
    }
    
    var balanceString: String {
        return L10n.Kids.List.Item.balance(saveMoney ?? "0",
                                           needMoney ?? "0")
    }
    
    
    
}

extension Kid: Decodable {
    
    enum KidCodingKeys: String, CodingKey {
        case fullName = "name-kids"
        case diagnoz
        case needMoney = "nujnaya_summa"
        case saveMoney = "sobrannaya_summa"
        case remaindMoney = "ostalos_sobrat"
        case birthday
        case dieday = "kids_death_day"
        case city = "city_kids"
        case descriptionText = "opisanie_rebenka"
        case status = "khod_lecheniya"
        case kidStatus = "status"
        case img
        case linkHelp = "link_help"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KidCodingKeys.self)
        
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        diagnoz = try container.decodeIfPresent(String.self, forKey: .diagnoz)
        needMoney = try container.decodeIfPresent(String.self, forKey: .needMoney)
        saveMoney = try container.decodeIfPresent(String.self, forKey: .saveMoney)
        remaindMoney = try container.decodeIfPresent(String.self, forKey: .remaindMoney)
        bithday = try container.decodeIfPresent(String.self, forKey: .birthday)
        dieday = try container.decodeIfPresent(String.self, forKey: .dieday)
        city = try container.decodeIfPresent(String.self, forKey: .city)
        descriptionText = try container.decodeIfPresent(String.self, forKey: .descriptionText)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        let statusString = try container.decodeIfPresent(String.self, forKey: .kidStatus)
        kidStatus = KidStatus(rawValue: statusString ?? "") ?? .undefined
        
        do {
           let cont = try container.decodeIfPresent(KidImage.self, forKey: .img)
           image = cont?.url
        } catch _ {
           image = nil
        }
        linkHelp = try container.decodeIfPresent(String.self, forKey: .linkHelp)
    }
}

struct KidImage {
    let url: String?
}

extension KidImage: Decodable {
    
    enum KidImageCodingKeys: String, CodingKey {
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KidImageCodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
