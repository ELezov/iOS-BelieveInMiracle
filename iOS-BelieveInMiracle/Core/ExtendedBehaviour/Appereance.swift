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
        UITabBar.appearance().tintColor = Color.Base.primaryDark
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().barTintColor = Color.Base.white
        UINavigationBar.appearance().tintColor = Color.Base.primaryDark
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Color.Text.primaryDark]
        UINavigationBar.appearance().barStyle = .black
    }
}
