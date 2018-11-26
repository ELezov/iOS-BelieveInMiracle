import UIKit


final class DonateWelcomeVC:
ViewController,
DonateWelcomeView {
    
    var onDonateTapped: EmptyCompletion?
    var viewModel: DonateWelcomeViewModelAbstract?
    
    // MARK: - Outlets
    
    @IBOutlet weak var lDescription: UILabel! {
        didSet {
            lDescription.font = FontStyle.h2.style()
            lDescription.textColor = UIColor(Color.primaryDark)
        }
    }
    @IBOutlet private weak var ivPoster: UIImageView! {
        didSet {
            ivPoster.image = Asset.Volunteer.help.image
            ivPoster.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet private weak var bDonationAction: ActionButton! {
        didSet {
            bDonationAction.style = .filled
            bDonationAction.status = .enabled
        }
    }
    
    @IBOutlet private weak var lSubtitle: UILabel! {
        didSet {
            lSubtitle.font = FontStyle.subtitle2.style()
            lSubtitle.textColor = UIColor(Color.textPrimaryDark)
        }
    }
    
    @IBOutlet private weak var ivArrowIcon: UIImageView! {
        didSet {
            ivArrowIcon.image = Asset.Volunteer.arrow.image
            ivArrowIcon.contentMode = .scaleAspectFit
        }
    }
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?
            .setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?
            .setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Actions
    
    @IBAction private func didDonateTapped(_ sender: Any) {
        onDonateTapped?()
    }
    
}
