//
//  KidsResponse.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

struct KidsResult {
    let kid: Kid?
}

extension KidsResult: Decodable {
    
    enum KidsResultCodingKeys: String, CodingKey {
        case kid = "acf"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KidsResultCodingKeys.self)
        kid = try container.decode(Kid.self, forKey: .kid)
    }
}
