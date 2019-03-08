//
//  AboutProgrammsCellView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import UIKit

class AboutProgrammsCellView: BaseCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var lTitle: LabelMain2! {
        didSet {
            lTitle.text = L10n.About.Programms.title
        }
    }
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: - Public Functions
    
    func configureTitle(title: String?) {
        lTitle.text = title
    }
    
    func configureScrollView(models: [ProgrammItemModel]) {
        scrollView.layoutIfNeeded()
        var totalWidth: CGFloat = 0.0
        for (index, model) in models.enumerated() {
            let frame = CGRect(
                x: 200 * CGFloat(index),
                y: 0,
                width: 200,
                height: scrollView.bounds.size.height)
            let view = ProgrammItemView(frame: frame)
            totalWidth = view.bounds.width * CGFloat(index + 1)
            view.imageView.image = model.img
            view.label.text = model.description
            self.scrollView.addSubview(view)
        }
        
        scrollView.contentSize = CGSize(
            width: totalWidth,
            height: scrollView.bounds.size.height)
    }
    
}
