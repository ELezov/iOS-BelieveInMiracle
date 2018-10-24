//
//  CloudPaymentsManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 24.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation

protocol CloudPaymentsManagerable {
    
    func makeSecurePacket(
        cardNumber: String,
        expirationDate: String,
        cvvNumber: String) -> String?
    
    func detectTypeCard(cardNumber: String) -> CPCardType
    
    func isValid(cardNumber: String) -> Bool
}

class CloudPaymentsManager: CloudPaymentsManagerable {
    
    let apiService: CPService
    let apiPublicId: String
    let apiSecret: String
    
    init(apiPublicId: String, apiSecret: String) {
        self.apiPublicId = apiPublicId
        self.apiSecret = apiSecret
        self.apiService = CPService.init()
    }
    
    func makeSecurePacket(
        cardNumber: String,
        expirationDate: String,
        cvvNumber: String) -> String? {
        let secureInfo = apiService.makeCardCryptogramPacket(
            cardNumber,
            andExpDate: expirationDate,
            andCVV: cvvNumber,
            andStorePublicID: apiPublicId)
        return secureInfo
    }
    
    func detectTypeCard(cardNumber: String) -> CPCardType {
        return CPService.cardType(fromCardNumber: cardNumber)
    }
    
    func isValid(cardNumber: String) -> Bool {
        return CPService.isCardNumberValid(cardNumber)
    }
}
