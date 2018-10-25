//
//  RequestVolunterTypeBaseCellViewModel.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

enum VolunteerType{
    case hospital
    case address
    case event
    case distance
    case clown
}

final class RequestVolunterTypeBaseCellViewModel:
CellViewModelFaceless,
CellViewModelHeightable,
CellViewModelActionableFasseles,
CellViewModelExpandable {
    
    var icon: UIImage {
        switch type {
        case .hospital:
            return Asset.Volunteer.hospitalVolunteer.image
        case .address:
            return Asset.Volunteer.adressVolunteer.image
        case .event:
            return Asset.Volunteer.eventVolunteer.image
        case .distance:
            return Asset.Volunteer.distanceVolunteer.image
        case .clown:
            return Asset.Volunteer.clownTherapy.image
        }
    }
    
    var title: String {
        switch type {
        case .hospital:
            return L10n.Volunteer.Hospitalvolunteer.title
        case .address:
            return L10n.Volunteer.Adressvolunteer.title
        case .event:
            return L10n.Volunteer.Eventvolunteer.title
        case .distance:
            return L10n.Volunteer.Distancevolunteer.title
        case .clown:
            return L10n.Volunteer.Clowntherapy.title
        }
    }
    
    var description: String {
        switch type {
        case .hospital:
            return L10n.Volunteer.Hospitalvolunteer.description
        case .address:
            return L10n.Volunteer.Adressvolunteer.description
        case .event:
            return L10n.Volunteer.Eventvolunteer.description
        case .distance:
            return L10n.Volunteer.Distancevolunteer.description
        case .clown:
            return L10n.Volunteer.Clowntherapy.description
        }
    }
    
    var expandedState: ExpandableState = .expanded
    
    typealias OnClick = (RequestVolunterTypeBaseCellViewModel) -> Void
    
    var onClick: OnClick?
    var onIndicator: EmptyCompletion?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    let type: VolunteerType
    var isChecked: Bool = false
    let tag: Int
    
    init(onClick: OnClick?,
         onIndicator: EmptyCompletion?,
         type: VolunteerType,
         tag: Int) {
        self.onClick = onClick
        self.onIndicator = onIndicator
        self.type = type
        self.tag = tag
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
        cell.onCheck = { isChecked in
            self.isChecked = isChecked
            self.onClick?(self)
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
