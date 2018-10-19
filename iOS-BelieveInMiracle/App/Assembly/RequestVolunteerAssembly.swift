//
//  RequestVolunteerAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

//swiftlint:disable force_unwrapping
final class RequestVolunteerAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RequestVolunteerFlowCoordinator.self) { (resolver: Resolver) in
            let router = resolver.resolve(RouterAbstract.self)!
            let coordinator = RequestVolunteerFlowCoordinator(router: router, diContainer: resolver)
            return coordinator
        }
        
        container.register(TableManagerable.self) { _ in
            return BaseTableManager()
        }.inObjectScope(.transient)
        
        container.register(RequestVolunteerVCTableBuilderAbstract.self) { _ in
            return RequestVolunteerVCTableBuilder()
        }
        
        container.register(RequestVolunteerViewModelAbstract.self) { _ in
            let viewModel = RequestVolunteerViewModel()
            return viewModel
        }
        
        container.register(RequestVolunteerView.self) { resolver in
            let controller = UIStoryboard.makeController(RequestVolunteerVC.self)
            controller.viewModel = resolver.resolve(RequestVolunteerViewModelAbstract.self)
            controller.tableViewModel = resolver.resolve(TableManagerable.self)
            controller.tableBuilder = resolver.resolve(RequestVolunteerVCTableBuilderAbstract.self)
            return controller
        }
    }
}