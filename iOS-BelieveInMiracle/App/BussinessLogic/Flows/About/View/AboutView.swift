import Foundation

protocol AboutView: Presentable {
    var onOpenSocial: ((String?, String) -> Void)? { get set }
}
