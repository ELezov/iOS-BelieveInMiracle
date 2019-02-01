//
//  LoadingCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 12/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class LoadingCellView: UITableViewCell {
    
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView! {
        didSet {
            indicatorView.activityIndicatorViewStyle = .gray
            indicatorView.hidesWhenStopped = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //indicatorView.startAnimating()
        // Initialization code
    }
    
    deinit {
        indicatorView.stopAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
