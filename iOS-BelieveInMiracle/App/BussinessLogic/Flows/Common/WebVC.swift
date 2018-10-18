import UIKit
import WebKit
import SnapKit
import NVActivityIndicatorView

final class WebVC:
ViewController,
WebView,
NVActivityIndicatorViewable {

    // MARK: - Public
    
    var viewModel: WebViewModelAbstract?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var containerView: UIView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        showIndicatorView()
    }
}

fileprivate extension WebVC {
    
    func configureWebView() {
        let webView = UIWebView(frame: containerView.bounds)
        guard let url = viewModel?.url
            else { return }
        webView.scalesPageToFit = true
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        webView.delegate = self
        containerView.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension WebVC: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        guard !webView.isLoading else { return }
        self.hideIndicatorView()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.hideIndicatorView()
    }
}
