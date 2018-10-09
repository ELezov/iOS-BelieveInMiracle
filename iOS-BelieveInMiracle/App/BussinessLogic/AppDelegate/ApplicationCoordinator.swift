import Foundation
import Swinject

final class ApplicationCoordinator: BaseCoordinator {
    
    let diContainer: Resolver

    init(diContainer: Resolver) {
        self.diContainer = diContainer
        super.init()
    }
    
    
    override func start() {
        runMainFlow()
    }
    
    /// Главное флоу
    private func runMainFlow() {
        guard let coordinator = diContainer.resolve(MainCoordinator.self) else { return }
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        UIApplication.shared.keyWindow?.rootViewController = coordinator.start()
    }
}
