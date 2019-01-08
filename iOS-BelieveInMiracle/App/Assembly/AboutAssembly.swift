//
//  AboutAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

//swiftlint:disable force_unwrapping
final class AboutAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(AboutFlowCoordinator.self) { (resolver: Resolver) in
            let router = resolver.resolve(RouterAbstract.self)!
            let coordinator = AboutFlowCoordinator(router: router, diContainer: resolver)
            return coordinator
        }
        
        container.register(AboutViewModelAbstract.self) { _ in
            let viewModel = AboutViewModel()
            return viewModel
        }
        
        container.register(AboutView.self) { resolver in
            let controller = UIStoryboard.makeController(AboutVC.self)
            controller.viewModel = resolver.resolve(AboutViewModelAbstract.self)
            controller.tableViewModel = resolver.resolve(TableManagerable.self)
            controller.tableBuilder = resolver.resolve(AboutVCTableBuilderAbstract.self)
            return controller
        }
        
        container.register(AboutVCTableBuilderAbstract.self) { _ in
            return AboutVCTableBuilder()
        }
        
    }
}
