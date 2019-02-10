//
//  AboutSocialCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutSocialCellView: BaseCell {
    
    var onSocial: SocialTypeCompletion?
    
    // MARK: - Outlest
    
    @IBOutlet private weak var vkButton: UIButton! {
        didSet {
            vkButton.setImage(Asset.About.vkontakte.image,
                              for: .normal)
        }
    }
    
    @IBOutlet private weak var fbButton: UIButton! {
        didSet {
            fbButton.setImage(Asset.About.facebook.image,
                              for: .normal)
        }
    }
    
    @IBOutlet private weak var instaButton: UIButton! {
        didSet {
            instaButton.setImage(Asset.About.instagram.image,
                                 for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func vkDidTapped(_ sender: Any) {
        onSocial?(.vk)
    }
    @IBAction private func facebookDidTapped(_ sender: Any) {
        onSocial?(.facebook)
    }
    @IBAction private func instagramDidTapped(_ sender: Any) {
       onSocial?(.instagram)
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var lTitle: LabelH2! {
        didSet {
            lTitle.text = L10n.About.Social.title
        }
    }
}
