import UIKit

/// Менеджер по настройки appearance
final class AppearanceManager {
    func apply() {
        configureTabBar()
        configureNavigationBar()
    }
}

fileprivate extension AppearanceManager {
    
    func configureTabBar() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(Color.primaryDark)
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor(Color.white)
        UINavigationBar.appearance().tintColor = UIColor(Color.primaryDark)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor(Color.textPrimaryDark)]
        UINavigationBar.appearance().isTranslucent = false
    }
}
