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
        return showKidsList()
    }
    
    private func showKidsList() -> UINavigationController? {
        let controller = diContainer.resolve(KidsListView.self)
        controller?.onShowDetails = { [weak self] configModel in
            self?.showKidDetails(configModel: configModel)
        }
        router.setRootModule(controller)
        return router.rootController
    }
    
    private func showKidDetails(configModel: KidDetailsConfigurationModel) {
        let controller = diContainer.resolve(KidDetailsView.self, argument: configModel)
        controller?.onShowHelp = { [weak self] urlString in
            self?.openURL(urlString: urlString)
        }
        router.push(controller)
    }
}
