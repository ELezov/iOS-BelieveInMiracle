//
//  KidsFlowCoordinator.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

import Foundation
import Swinject

final class KidsFlowCoordinator:
BaseCoordinator {
    
    var finishFlow: DefaultFinishHandler?
    
    let router: RouterAbstract
    let diContainer: Resolver
    
    init(router: RouterAbstract, diContainer: Resolver) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() -> UINavigationController? {
        return showKidsList()
    }
    
    private func showKidsList() -> UINavigationController? {
        let controller = diContainer.resolve(KidsListView.self)
        router.setRootModule(controller)
        return router.rootController
    }
}

