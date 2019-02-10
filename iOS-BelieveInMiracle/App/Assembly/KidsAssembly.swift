//
//  KidsAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

//swiftlint:disable force_unwrapping
final class KidsAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(KidsFlowCoordinator.self) { (resolver: Resolver) in
            let router = resolver.resolve(RouterAbstract.self)!
            let coordinator = KidsFlowCoordinator(router: router, diContainer: resolver)
            return coordinator
        }
        
        // KidList
        
        container.register(KidsListViewModelAbstract.self) { _ in
            let viewModel = KidsListViewModel()
            return viewModel
        }
        
        container.register(KidsListView.self) { resolver in
            let controller = UIStoryboard.makeController(KidsListVC.self)
            controller.viewModel = resolver.resolve(KidsListViewModelAbstract.self)
            controller.tableViewModel = resolver.resolve(TablePaginable.self)
            return controller
        }
        
        // KidDetails
        
        container.register(KidDetailsViewModelAbstract.self) { (resolver, configModel: KidDetailsConfigurationModel) in
            let viewModel = KidDetailsViewModel(configModel: configModel)
            return viewModel
        }
        
        container.register(KidDetailsView.self) { (resolver, configModel: KidDetailsConfigurationModel) in
            let controller = UIStoryboard.makeController(KidDetailsVC.self)
            controller.viewModel = resolver.resolve(KidDetailsViewModelAbstract.self, argument: configModel)
            controller.tableViewModel = resolver.resolve(TableParallaxable.self)
            return controller
        }
    }
}
