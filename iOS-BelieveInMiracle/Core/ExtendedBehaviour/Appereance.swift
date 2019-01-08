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
        UITabBar.appearance().tintColor = UIColor(Color.Base.primaryDark)
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor(Color.Base.white)
        UINavigationBar.appearance().tintColor = UIColor(Color.Base.primaryDark)
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor(Color.Text.primaryDark)]
        //UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .black
    }
}
