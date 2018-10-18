import Foundation

final class DonateViewModel: ViewModel, DonateViewModelAbstract {
    
    var configurationBankDonateModel: WebViewConfigurationModel {
        return WebViewConfigurationModel(stringURL: GlobalConstants.donateLink)
    }
}
