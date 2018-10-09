import UIKit

protocol RouterAbstract: Presentable {
    
    var rootController: UINavigationController? { get }
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, hideBottom: Bool)
    func push(_ module: Presentable?, animated: Bool, hideBottom: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popToModule(_ module: Presentable?) 
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func dismissModule(_ module: Presentable?)
    func dismissModule(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
    
    func presentAlert(_ module: Presentable?)
}


extension RouterAbstract {
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func dismissModule(_ module: Presentable?) {
        dismissModule(module, animated: true, completion: nil)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, hideBottom: false, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottom: Bool) {
        push(module, animated: animated, hideBottom: hideBottom, completion: nil)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
}
