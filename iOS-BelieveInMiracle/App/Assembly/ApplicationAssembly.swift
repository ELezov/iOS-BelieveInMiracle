//
//  ApplicationAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

//swiftlint:disable force_unwrapping
final class ApplicationAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(NavigationController.self) { _ in
            let coordinator = UIStoryboard.makeController(NavigationController.self)
            return coordinator
        }
        
        container.register(RouterAbstract.self) { resolver in
            let rootController = resolver.resolve(NavigationController.self)!
            let router = Router(rootController: rootController)
            return router
        }
        
        container.register(ApplicationCoordinator.self) { resolver in
            let coordinator = ApplicationCoordinator(diContainer: resolver)
            return coordinator
        }.inObjectScope(.container)
        
        container.register(MainCoordinator.self) { (resolver: Resolver) in
            let coordinator = MainCoordinator(diContainer: resolver)
            return coordinator
        }.inObjectScope(.transient)
        
        container.register(AppearanceManager.self) { _ in
            return AppearanceManager()
        }
        
        container.register(FrameworksManager.self) { _ in
            return FrameworksManager()
        }
    }
}
