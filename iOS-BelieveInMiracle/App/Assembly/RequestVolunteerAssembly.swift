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
            //controller.tableViewModel = resolver.resolve(TableManagerable.self)
            controller.tableBuilder = resolver.resolve(RequestVolunteerVCTableBuilderAbstract.self)
            return controller
        }
        
        // RequestVolunteerInfo
        
        container.register(RequestVolunteerInfoViewModelAbstract.self) { _ in
            let viewModel = RequestVolunteerInfoViewModel()
            return viewModel
        }
        
        container.register(RequestVolunteerInfoView.self) { resolver in
            let controller = UIStoryboard.makeController(RequestVolunteerInfoVC.self)
            controller.viewModel = resolver.resolve(RequestVolunteerInfoViewModelAbstract.self)
            return controller
        }
        
        // DonateWelcome
        
        container.register(DonateWelcomeViewModelAbstract.self) { _ in
            let viewModel = DonateWelcomeViewModel()
            return viewModel
        }
        
        container.register(DonateWelcomeView.self) { resolver in
            let controller = UIStoryboard.makeController(DonateWelcomeVC.self)
            controller.viewModel = resolver.resolve(DonateWelcomeViewModelAbstract.self)
            return controller
        }

    }
}
