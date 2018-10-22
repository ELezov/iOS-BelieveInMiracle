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

    var expandedState: ExpandableState = .expanded {
        didSet {
            
        }
    }
    
    typealias OnClick = (RequestVolunterTypeBaseCellViewModel) -> Void
    
    var onClick: OnClick?
    var onIndicator: EmptyCompletion?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    
    let icon: UIImage
    let title: String
    let description: String
    
    init(onClick: OnClick?,
         onIndicator: EmptyCompletion?,
         icon: UIImage,
         title: String,
         description: String) {
        self.onClick = onClick
        self.onIndicator = onIndicator
        self.icon = icon
        self.title = title
        self.description = description
    }
    
    func setup(cell: RequestVolunterTypeBaseCellView) {
        cell.stackView.removeAllArrangedSubviews()
        handleExpandable(stackView: cell.stackView)
        cell.typeIconView.image = icon
        cell.typeTitleLabel.text = title
        cell.onIndicatorTapped = {
            self.expandedState = (self.expandedState == .expanded) ? .collapsed : .expanded
            switch self.expandedState {
            case .expanded:
                cell.animateRotation(fromValue: Double.pi, toValue: 0.0)
            case .collapsed:
                cell.animateRotation(fromValue: 0.0, toValue: Double.pi)
            }
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
        if let view = RequestVolunteerDescriptionView.setup(title: description) {
             view.configure()
             view.layoutIfNeeded()
             result.append(view)
        }
        
        return result
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
