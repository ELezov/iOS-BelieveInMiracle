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
        UINavigationBar.appearance().barTintColor = UIColor(Color.primaryDark)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().isTranslucent = false
    }
}
