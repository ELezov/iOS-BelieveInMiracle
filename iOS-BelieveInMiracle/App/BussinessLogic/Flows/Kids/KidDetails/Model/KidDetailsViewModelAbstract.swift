import Foundation

struct KidDetailsConfigurationModel {
    let kid: Kid
}

protocol KidDetailsViewModelAbstract: ViewModelAbstract {
    
    var kidFullName: String? { get }
    var kidDiagnosis: String? { get }
    var kidDescription: String? { get }
    var kidImageUrl: String? { get }
    var linkHelped: String? { get }
}
