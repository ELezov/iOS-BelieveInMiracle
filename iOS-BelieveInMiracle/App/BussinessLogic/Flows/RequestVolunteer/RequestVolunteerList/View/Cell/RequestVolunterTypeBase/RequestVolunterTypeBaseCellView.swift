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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func indicatorButtonTapped(_ sender: Any) {
        let view = UIView()
        view.backgroundColor = UIColor.red
        stackView.addArrangedSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(30)
        }
        onIndicatorTapped?()
    }
    
}
