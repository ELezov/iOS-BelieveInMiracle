import Foundation

typealias EmptyCompletion = () -> Void
typealias DefaultFinishHandler = EmptyCompletion


/// Абстракный класс координатор
class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    
    func start() {
        start()
    }
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.reversed().enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
