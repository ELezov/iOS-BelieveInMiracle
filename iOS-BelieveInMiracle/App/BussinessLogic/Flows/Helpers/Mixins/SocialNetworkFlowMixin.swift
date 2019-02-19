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
    
    func differentApp(appUrlString: String?,
                      safariURLString: String)
}

extension SocialNetworkFlowMixin where Self: BaseCoordinator {
    
    func differentApp(appUrlString: String?,
                      safariURLString: String) {
        guard let safariURL = URL(string: safariURLString) else { return }
        
        guard
            let appUrlString = appUrlString,
            let appUrl = URL(string: appUrlString)
        else {
            UIApplication.shared.open(safariURL)
            return
        }
        if UIApplication.shared.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl)
        } else {
            UIApplication.shared.open(safariURL)
        }
    }
}
