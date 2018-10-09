//
//  MainAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

final class MainAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(MainView.self) { _ in
            let controller = UIStoryboard.makeController(MainVC.self)
            return controller
        }
        
    }
}
