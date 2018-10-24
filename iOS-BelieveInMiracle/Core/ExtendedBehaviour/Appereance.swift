import UIKit

/// Менеджер по настройки appearance
final class AppearanceManager {
    func apply() {
        configureTabBar()
    }
}

fileprivate extension AppearanceManager {
    
    func configureTabBar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(Color.primaryDark)
    }
}
