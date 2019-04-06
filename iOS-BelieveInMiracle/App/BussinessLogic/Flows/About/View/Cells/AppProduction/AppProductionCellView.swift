//
//  AppProductionCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by EugenKGD on 11/03/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AppProductionCellView: UITableViewCell {

    @IBOutlet weak private var appVersionLabel: UILabel! {
        didSet {
            appVersionLabel.textAlignment = .right
        }
    }
    
    @IBOutlet weak private var developerTextView: UITextView! {
        didSet {
            developerTextView.attributedText = configureText()
            developerTextView.isEditable = false
        }
    }
    
    var appVersion: String? {
        didSet {
            appVersionLabel.attributedText = configureVersionAttributedString(text: appVersion)
        }
    }
}

fileprivate extension AppProductionCellView {
    func configureVersionAttributedString(text: String?) -> NSMutableAttributedString? {
        guard let text = text else { return nil }
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12.0)]
        
        attributedString.addAttributes(attributes,
                                       range: NSRange(location: 0,
                                                      length: attributedString.string.count))
        return attributedString
    }
    
    func configureText() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: L10n.About.Author.developed)
        let attributedName = NSMutableAttributedString(string: L10n.About.Author.name)
        attributedName.addAttribute(.link,
                                    value: "https://vk.com/chegy",
                                    range: NSRange(location: 0,
                                                   length: L10n.About.Author.name.count))
        attributedString.append(attributedName)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12.0)]
        
        attributedString.addAttributes(attributes,
                                       range: NSRange(location: 0,
                                                      length: attributedString.string.count))
        
        return attributedString
    }
}

extension AppProductionCellView: UITextViewDelegate {
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
}
