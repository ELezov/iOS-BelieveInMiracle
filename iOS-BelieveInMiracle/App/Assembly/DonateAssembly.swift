//
//  DonateAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

//swiftlint:disable force_unwrapping
final class DonateAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(DonateFlowCoordinator.self) { (resolver: Resolver) in
            let router = resolver.resolve(RouterAbstract.self)!
            let coordinator = DonateFlowCoordinator(router: router, diContainer: resolver)
            return coordinator
        }
        
        container.register(DonateViewModelAbstract.self) { _ in
            let viewModel = DonateViewModel()
            return viewModel
        }
        
        container.register(DonateView.self) { resolver in
            let controller = UIStoryboard.makeController(DonateVC.self)
            controller.viewModel = resolver.resolve(DonateViewModelAbstract.self)
            controller.tableBuilder = resolver.resolve(DonateVCTableBuilderAbstract.self)
            controller.tableViewModel = resolver.resolve(TableManagerable.self)
            return controller
        }
        
        container.register(DonateVCTableBuilderAbstract.self) { _ in
            return DonateVCTableBuilder()
        }
    }
}
