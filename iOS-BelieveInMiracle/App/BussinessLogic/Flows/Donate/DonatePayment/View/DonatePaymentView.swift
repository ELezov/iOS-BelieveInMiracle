import Foundation

protocol DonatePaymentView: Presentable {
    typealias PaymentCompletion = (String, [PKPaymentNetwork], PKPaymentAuthorizationViewControllerDelegate) -> Void
    var onApplePay: PaymentCompletion? { get set }
}
