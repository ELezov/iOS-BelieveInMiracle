//
//  AppDelegate.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 04.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var diContainer: Resolver = {
        let factory = AssemblyFactory()
        let resolver = factory.makeResolver()
        return resolver
    }()
    
    /// Главный координатор приложения
    private lazy var applicationCoordinator: Coordinator? = {
        let coordinator = diContainer.resolve(ApplicationCoordinator.self)
        return coordinator
    }()
    
    private lazy var cloudManager: CloudPaymentsManagerable? = {
        let cloudManager = diContainer.resolve(CloudPaymentsManagerable.self)
        return cloudManager
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupAppearance()
        
        let type = cloudManager?.detectTypeCard(cardNumber: "5422550481370424")
        
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        applicationCoordinator?.start()
        return true
    }
    
    /// Настройка глобальных стилей приложения
    func setupAppearance() {
        let appearanceManager = diContainer.resolve(AppearanceManager.self)
        appearanceManager?.apply()
    }
}
