//
//  RequestVolunteerFlowCoordinator.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

final class RequestVolunteerFlowCoordinator:
BaseCoordinator {
    
    var finishFlow: DefaultFinishHandler?
    
    let router: RouterAbstract
    let diContainer: Resolver
    
    init(router: RouterAbstract, diContainer: Resolver) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() -> UINavigationController? {
        return showRequestVolunteerList()
    }
    
    private func showRequestVolunteerList() -> UINavigationController? {
        let controller = diContainer.resolve(RequestVolunteerView.self)
        controller?.onContinueTapped = { [weak self] in
            self?.showRequestVolunteerInfo()
        }
        router.setRootModule(controller)
        return router.rootController
    }
    
    private func showRequestVolunteerInfo() {
        let controller = diContainer.resolve(RequestVolunteerInfoView.self)
        router.push(controller)
    }
}
