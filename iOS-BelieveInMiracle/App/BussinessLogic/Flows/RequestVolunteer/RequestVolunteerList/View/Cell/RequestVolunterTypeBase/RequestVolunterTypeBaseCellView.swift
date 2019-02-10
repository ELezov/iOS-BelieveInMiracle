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
class RequestVolunterTypeBaseCellView: BaseCell {
    
    // MARK: - Constants
    
    enum Constants {
        static let animationDuration = 0.3
    }
    
    var onIndicatorTapped: EmptyCompletion?
    var onCheck: BoolCompletion?
    
    // MARK: - Outlets
    
    var checkBox: LOTAnimatedSwitch?
    
    @IBOutlet weak var checkBoxContainer: UIView!
    @IBOutlet weak var indicatorButton: UIButton!
    @IBOutlet weak var typeIconView: UIImageView!
    @IBOutlet weak var typeTitleLabel: LabelH3!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heightConstraintSeparatorView: NSLayoutConstraint! {
        didSet {
            heightConstraintSeparatorView.constant = 0.5
        }
    }
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Color.Base.separator
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCheckbox()
    }
    
    @objc
    func switchTapped(_ sender: LOTAnimatedSwitch) {
        onCheck?(sender.isOn)
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

fileprivate extension RequestVolunterTypeBaseCellView {
    
    func configureCheckbox() {
        checkBox = LOTAnimatedSwitch.init(named: "checked_done")
        guard let checkBox = checkBox else { return }
        checkBox.setOn(false, animated: false)
        checkBox.setProgressRangeForOffState(fromProgress: 0.2, toProgress: 0)
        checkBox.setProgressRangeForOnState(fromProgress: 0, toProgress: 1)
        checkBox.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
        self.checkBoxContainer.addSubview(checkBox)
        checkBox.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
