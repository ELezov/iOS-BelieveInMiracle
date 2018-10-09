import UIKit

class MainVC: UITabBarController, MainView {
    
    var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = controllers
    }

}

