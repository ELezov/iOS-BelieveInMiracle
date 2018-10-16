import UIKit
import WebKit
import SnapKit

final class WebVC:
ViewController,
WebView {

    // MARK: - Public
    
    var viewModel: WebViewModelAbstract?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var containerView: UIView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    // MARK: - Private Methods
    
    private func configureWebView() {
        let webView = UIWebView(frame: containerView.bounds)
        guard let url = viewModel?.url
            else { return }
        webView.scalesPageToFit = true
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        containerView.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
