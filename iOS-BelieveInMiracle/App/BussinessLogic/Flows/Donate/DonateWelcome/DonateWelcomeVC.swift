import UIKit


final class DonateWelcomeVC:
ViewController,
DonateWelcomeView {
    
    var onDonateTapped: EmptyCompletion?
    var viewModel: DonateWelcomeViewModelAbstract?
    
    // MARK: - Outlets
    
    @IBOutlet weak var lDescription: LabelMain1! {
        didSet {
            lDescription.text = L10n.Donate.Screen.description
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
            bDonationAction.setTitle(L10n.Donate.Help.money,
                                     for: .normal)
            bDonationAction.style = .filled
            bDonationAction.status = .enabled
        }
    }
    
    @IBOutlet private weak var lSubtitle: LabelMain3! {
        didSet {
            lSubtitle.text = L10n.Donate.Help.volunteer
        }
    }
    
    @IBOutlet private weak var ivArrowIcon: UIImageView! {
        didSet {
            let image = Asset.Volunteer.arrow.image
            ivArrowIcon.image = image.withHorizontallyFlippedOrientation()
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
