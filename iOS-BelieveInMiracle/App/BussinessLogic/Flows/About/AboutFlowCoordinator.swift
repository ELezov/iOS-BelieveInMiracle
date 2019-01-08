import Foundation
import Swinject

final class AboutFlowCoordinator:
BaseCoordinator,
SocialNetworkFlowMixin {

    
    
    var finishFlow: DefaultFinishHandler?
    
    let router: RouterAbstract
    let diContainer: Resolver
    
    init(router: RouterAbstract, diContainer: Resolver) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() -> UINavigationController? {
        return showAbout()
    }
    
    private func showAbout() -> UINavigationController? {
        let controller = diContainer.resolve(AboutView.self)
        controller?.onOpenVK = { [weak self] in
            self?.openVK(urlString: GlobalConstants.Social.urlVk)
        }
        router.setRootModule(controller)
        return router.rootController
    }
}
