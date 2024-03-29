//
//  ProgrammItemView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

import SnapKit
import UIKit

final class ProgrammItemView: UniversalSetupableView {
    
    enum Constants {
        enum ImageView {
            static let height: CGFloat = 75.0
        }
    }

    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    let label: LabelMain4 = {
        let label = LabelMain4()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    var programm: ProgrammItemModel? {
        didSet {
            label.text = programm?.description
            imageView.image = programm?.img
        }
    }
    
    var onClick: OptionalStringCompletion?

    // MARK: - Override

    override func configure() {
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(itemDidSelected), for: .touchUpInside)
    }
    
    @objc func itemDidSelected() {
        onClick?(programm?.link)
    }

    override func setupConstraints() {
        imageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(UIConstants.Margin.default)
            maker.trailing.equalToSuperview().offset(-UIConstants.Margin.default)
            maker.height.equalTo(Constants.ImageView.height)
            maker.top.equalToSuperview()
        }
        
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom)
            maker.leading.equalToSuperview().offset(UIConstants.Margin.default)
            maker.trailing.equalToSuperview().offset(-UIConstants.Margin.default)
            maker.bottom.equalToSuperview().offset(-UIConstants.Margin.default)
        }
        
        button.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
