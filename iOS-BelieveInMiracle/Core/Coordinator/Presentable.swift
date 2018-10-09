import UIKit

/// Обозначает возможность сущности участвовать в навигации
protocol Presentable: class {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
