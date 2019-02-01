//
//  KidsApi.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation
import Moya

enum KidsApi {
    case fetchAll(page: Int)
}


extension KidsApi: TargetType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        default:
            return GlobalConstants.Base.baseURL
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("ERROR: baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchAll(let page):
            return "/kids"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchAll(let page):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .fetchAll(let page):
            return stubbedResponse("fetchAll")
        }
    }
    
    var task: Task {
        switch self {
        case .fetchAll(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject { }

    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
