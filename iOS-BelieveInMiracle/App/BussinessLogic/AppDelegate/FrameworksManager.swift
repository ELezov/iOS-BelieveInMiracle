//
//  FrameworksManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 26.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import IQKeyboardManager
import Fabric
import Crashlytics

final class FrameworksManager {
    
    func initAllFrameworks() {
        setupKeyboardManager()
    }
}

fileprivate extension FrameworksManager {
    
    func setupKeyboardManager() {
        IQKeyboardManager.shared().isEnableAutoToolbar = true
        Fabric.with([Crashlytics.self])
    }
    
}
