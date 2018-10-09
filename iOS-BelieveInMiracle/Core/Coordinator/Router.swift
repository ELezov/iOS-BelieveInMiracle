import UIKit

final class Router: NSObject, RouterAbstract {
    
    weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
    }
    
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        
        var topController: UIViewController? = rootController
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        topController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismissModule(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        module?.toPresent()?.dismiss(animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottom: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottom
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule(animated: Bool) {
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
        dismissModule()
    }
    
    func popToModule(_ module: Presentable?) {
        guard let view = module?.toPresent() else { return }
        rootController?.popToViewController(view, animated: true)?.forEach { controller in
            runCompletion(for: controller)
        }
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }
    
    func presentAlert(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        let window = UIWindow(frame: UIScreen.main.bounds)
        let backgroundViewController = UIViewController()
        backgroundViewController.view.backgroundColor = .clear
        window.rootViewController = backgroundViewController
        window.windowLevel = UIWindowLevelAlert + 1
        window.makeKeyAndVisible()
        backgroundViewController.present(controller, animated: true, completion: nil)
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
