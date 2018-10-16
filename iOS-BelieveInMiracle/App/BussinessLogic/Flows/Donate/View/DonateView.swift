import Foundation

protocol DonateView: Presentable {
    var onCardDonate: ((WebViewConfigurationModel) -> Void)? { get set }
}
