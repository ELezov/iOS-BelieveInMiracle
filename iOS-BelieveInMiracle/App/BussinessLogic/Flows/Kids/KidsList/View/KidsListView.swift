import Foundation

protocol KidsListView: Presentable {
    
    typealias KidCompletion = (KidDetailsConfigurationModel) -> Void
    
    var onShowDetails: KidCompletion? { get set }

}
