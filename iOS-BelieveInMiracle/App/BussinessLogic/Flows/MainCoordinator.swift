import UIKit
import Swinject

/// Коррдинатор главной сцены
final class MainCoordinator: BaseCoordinator & MainCoordinatorOutput {

    var finishFlow: DefaultFinishHandler?
    
    let diContainer: Resolver

    func start() -> UIViewController? {
        return showContainerScreen()
    }

    init(diContainer: Resolver) {
        self.diContainer = diContainer
    }
    
    func showContainerScreen() -> UIViewController? {
        guard let mainView = diContainer.resolve(MainView.self)
            else { return nil }
        guard let aboutFlowCoordinator = diContainer.resolve(AboutFlowCoordinator.self),
            let aboutVC: UIViewController = aboutFlowCoordinator.start() else {
                return nil
        }
        
        guard let donateFlowCoordinator = diContainer.resolve(DonateFlowCoordinator.self),
            let donateVC: UIViewController = donateFlowCoordinator.start() else {
                return nil
        }
        
        addDependency(aboutFlowCoordinator)
        addDependency(donateFlowCoordinator)
        mainView.controllers = [aboutVC, donateVC]
        return mainView.toPresent()
    }
}
