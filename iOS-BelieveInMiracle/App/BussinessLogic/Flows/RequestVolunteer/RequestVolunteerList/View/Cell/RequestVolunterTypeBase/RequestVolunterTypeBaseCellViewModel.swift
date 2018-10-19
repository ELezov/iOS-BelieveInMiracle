//
//  RequestVolunterTypeBaseCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

final class RequestVolunterTypeBaseCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable,
CellViewModelActionableFasseles,
CellViewModelExpandable {

    var expandedState: ExpandableState = .expanded
    
    typealias OnClick = (RequestVolunterTypeBaseCellViewModel) -> Void
    
    var onClick: OnClick?
    var onIndicator: EmptyCompletion?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let icon: UIImage
    let title: String
    
    init(onClick: OnClick?, onIndicator: EmptyCompletion?, icon: UIImage, title: String) {
        self.onClick = onClick
        self.onIndicator = onIndicator
        self.icon = icon
        self.title = title
    }
    
    func setup(cell: RequestVolunterTypeBaseCellView) {
        cell.stackView.removeAllArrangedSubviews()
        handleExpandable(stackView: cell.stackView)
        cell.typeIconView.image = icon
        cell.typeTitleLabel.text = title
        cell.onIndicatorTapped = {
            self.expandedState = (self.expandedState == .expanded) ? .collapsed : .expanded
            self.handleExpandable(stackView: cell.stackView)
            self.onIndicator?()
        }
    }
    
    func handleExpandable(stackView: UIStackView) {
        switch expandedState {
        case .collapsed:
            let views = configureCollapsedViews()
            views.forEach { (view) in
                stackView.addArrangedSubview(view)
            }
        case .expanded:
            stackView.removeAllArrangedSubviews()
        }
    }
    
    func configureCollapsedViews() -> [UIView] {
        var result = [UIView]()
        if let view = RequestVolunteerDescriptionView.setup(title: "\u{2022} Hahahaha") {
             view.layoutIfNeeded()
             result.append(view)
        }
       
        if let view = RequestVolunteerDescriptionView.setup(title: "\u{2022} HahahahaHahahahaHaha hahaHahahahaHahahaha") {
            view.layoutSubviews()
            result.append(view)
        }
        
        return result
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
