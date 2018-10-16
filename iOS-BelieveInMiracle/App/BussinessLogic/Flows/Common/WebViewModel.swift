import Foundation

final class WebViewModel: ViewModel, WebViewModelAbstract {
    
    var url: URL? {
        return URL(string: configModel.stringURL)
    }
    
    private var configModel: WebViewConfigurationModel
    
    init(configModel: WebViewConfigurationModel) {
        self.configModel = configModel
    }
}
