//
//  NetworkManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Moya

enum APIEnvironment {
    case staging
    case qa
    case production
}

struct NetworkManager {
    static let environment: APIEnvironment = .staging
}
