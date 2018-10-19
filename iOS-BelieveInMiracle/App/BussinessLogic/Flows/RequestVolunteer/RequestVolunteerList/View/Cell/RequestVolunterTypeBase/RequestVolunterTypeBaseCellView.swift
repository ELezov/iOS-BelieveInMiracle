//
//  RequestVolunterTypeBaseCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

//swiftlint:disable private_outlet
class RequestVolunterTypeBaseCellView: UITableViewCell {
    
    var onIndicatorTapped: EmptyCompletion?
    
    // MARK: - Outlets
    
    @IBOutlet weak var typeIconView: UIImageView!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = 5
    }
    
    
    
    @IBAction private func indicatorButtonTapped(_ sender: Any) {
        onIndicatorTapped?()
    }
    
}
