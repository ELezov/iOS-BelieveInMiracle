import Foundation
import Swinject

final class AboutFlowCoordinator: BaseCoordinator {
    
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
        router.setRootModule(controller)
        return router.rootController
    }
}
