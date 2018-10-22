//
//  RequestVolunteerDescriptionView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable private_outlet
class RequestVolunteerDescriptionView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    class func setup(title: String) -> RequestVolunteerDescriptionView? {
        guard
            let view = RequestVolunteerDescriptionView.loadFromNib()
        else { return nil }
        view.titleLabel.text = title
        return view
    }
    
    func configure() {
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = 1
        backgroundColor = UIColor.lightText
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2
        layer.cornerRadius = 3
    }

}
