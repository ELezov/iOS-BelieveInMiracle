//
//  RequestVolunterTypeBaseCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
import Lottie

//swiftlint:disable private_outlet
class RequestVolunterTypeBaseCellView: UITableViewCell {
    
    // MARK: - Constants
    
    enum Constants {
        static let animationDuration = 0.3
    }
    
    var onIndicatorTapped: EmptyCompletion?
    
    // MARK: - Outlets
    
    @IBOutlet weak var checkBoxContainer: UIView!
    @IBOutlet weak var indicatorButton: UIButton!
    @IBOutlet weak var typeIconView: UIImageView!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let checkBox = LOTAnimatedSwitch.init(named: "checked_done")
        checkBox.setOn(false, animated: false)
        checkBox.setProgressRangeForOffState(fromProgress: 1, toProgress: 0)
        checkBox.setProgressRangeForOnState(fromProgress: 0, toProgress: 1)
        checkBox.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        self.checkBoxContainer.addSubview(checkBox)
        checkBox.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.selectionStyle = .none
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = 5
    }
    
    @objc
    func switchTapped() {
        
    }
    
    @IBAction private func indicatorButtonTapped(_ sender: Any) {
        onIndicatorTapped?()
    }
    
    func animateRotation(fromValue: Double, toValue: Double) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = fromValue
        rotationAnimation.toValue = toValue
        rotationAnimation.duration = Constants.animationDuration
        rotationAnimation.isRemovedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        indicatorButton.layer.add(rotationAnimation, forKey: nil)
    }
    
}
