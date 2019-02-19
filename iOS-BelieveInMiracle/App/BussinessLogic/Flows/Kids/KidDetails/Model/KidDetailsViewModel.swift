import Foundation

final class KidDetailsViewModel: ViewModel, KidDetailsViewModelAbstract {
    
    let configModel: KidDetailsConfigurationModel
    
    init(configModel: KidDetailsConfigurationModel) {
        self.configModel = configModel
    }
    
    var kidFullName: String? {
        return configModel.kid.fullName
    }
    
    var kidDiagnosis: String? {
        return configModel.kid.diagnoz
    }
    
    var kidDescription: String? {
        return configModel.kid.descriptionText
    }
    
    var kidImageUrl: String? {
        return configModel.kid.image
    }
    
    var linkHelped: String? {
        return configModel.kid.linkHelp
    }
}
