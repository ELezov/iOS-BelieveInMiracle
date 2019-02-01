//
//  KidsNetworkManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation
import Moya
import Alamofire

class CustomServerTrustPoliceManager : ServerTrustPolicyManager {
    override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return .disableEvaluation
    }
    public init() {
        super.init(policies: [:])
    }
}

protocol KidsNetworkable {
    var provider: MoyaProvider<KidsApi>? { get }
    func getKids(page: Int, completion: @escaping ([Kid]?) -> (Void))
}

class KidsNetworkManager: KidsNetworkable {
    
    let manager = Manager(
        configuration: URLSessionConfiguration.default,
        serverTrustPolicyManager: CustomServerTrustPoliceManager()
    )
    
    var provider: MoyaProvider<KidsApi>?
    
    init() {
        provider = MoyaProvider<KidsApi>(manager: manager,
                                         plugins: [NetworkLoggerPlugin(verbose: true)])
    }

   // var provider = MoyaProvider<KidsApi>(plugins: [])
    
    func getKids(page: Int, completion: @escaping ([Kid]?) -> (Void)) {
        provider?.request(.fetchAll(page: page)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([KidsResult].self, from: response.data)
                    let kids = results.compactMap({ $0.kid })
                    completion(kids)
                } catch let err {
                    completion([])
                    print(err)
                }
            case let .failure(error):
                completion([])
                print(error)
            }
        }
    }
}
