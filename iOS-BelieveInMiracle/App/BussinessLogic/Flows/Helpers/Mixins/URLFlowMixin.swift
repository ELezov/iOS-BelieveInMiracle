import Swinject
import UIKit

/// Миксин для открытия URL

protocol URLFlowMixin: class {
    
    var router: RouterAbstract { get }
    var diContainer: Resolver { get }
    
    func openURL(urlString: String)
    
    func openURLinWebView(urlModel: WebViewConfigurationModel)
}

extension URLFlowMixin where Self: BaseCoordinator {
    
    func openURL(urlString: String) {
        guard
            let url = URL(string: urlString),
            UIApplication.shared.canOpenURL(url)
        else { return }
        UIApplication.shared.open(url)
    }
    
    func openURLinWebView(urlModel: WebViewConfigurationModel) {
        let controller = diContainer.resolve(WebView.self, argument: urlModel)
        router.push(controller)
    }
}
