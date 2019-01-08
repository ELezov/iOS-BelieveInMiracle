//
//  AboutSocialCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 07/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutSocialCellView: TableViewCell {
    
    var onSocial: SocialTypeCompletion?
    
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
