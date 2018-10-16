//
//  CommonAssembly.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 16.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

final class CommonAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(TableManagerable.self) { _ in
            return BaseTableManager()
        }.inObjectScope(.transient)
        
        // UrlWebView
        
        container.register(WebView.self) { (resolver: Resolver, configModel: WebViewConfigurationModel) in
            let controller = UIStoryboard.makeController(WebVC.self)
            let viewModel = resolver.resolve(WebViewModelAbstract.self, argument: configModel)
            controller.viewModel = viewModel
            return controller
        }
        
        container.register(WebViewModelAbstract.self) { ( _, configModel: WebViewConfigurationModel) in
            let viewModel = WebViewModel(configModel: configModel)
            return viewModel
        }
    }
    
   
}
