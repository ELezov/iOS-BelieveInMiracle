//
//  SocialNetworkFlowMixin.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Swinject
import UIKit

protocol SocialNetworkFlowMixin: class {
    
    var router: RouterAbstract { get }
    var diContainer: Resolver { get }
    
    func openVK(urlString: String)
}

extension SocialNetworkFlowMixin where Self: BaseCoordinator {
    
    func openVK(urlString: String) {
        guard
            let appURL = URL(string: "vk://\(urlString)"),
            let safariURL = URL(string: urlString)
        else { return }
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(safariURL)
        }
    }
}
