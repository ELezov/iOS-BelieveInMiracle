import UIKit

protocol MainView: Presentable {

    var controllers: [UIViewController] { get set }
}
