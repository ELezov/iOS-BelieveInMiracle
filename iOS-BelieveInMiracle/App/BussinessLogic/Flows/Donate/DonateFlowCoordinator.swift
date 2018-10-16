//
//  DonateFlowCoordinator.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 16.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

final class DonateFlowCoordinator:
BaseCoordinator,
URLFlowMixin {
    
    var finishFlow: DefaultFinishHandler?
    
    let router: RouterAbstract
    let diContainer: Resolver
    
    init(router: RouterAbstract, diContainer: Resolver) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() -> UINavigationController? {
        return showDonate()
    }
    
    private func showDonate() -> UINavigationController? {
        let controller = diContainer.resolve(DonateView.self)
        controller?.onCardDonate = { [weak self] configModel in
            self?.openURLinWebView(urlModel: configModel)
        }
        router.setRootModule(controller)
        return router.rootController
    }
}
