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
    var onIndicator: OnClick?
    
    static let cellHeight: CGFloat = UITableViewAutomaticDimension
    
    let height: CGFloat = cellHeight
    let type: VolunteerType
    var isChecked: Bool = false
    let tag: Int
    
    init(onClick: OnClick?,
         onIndicator: OnClick?,
         type: VolunteerType,
         tag: Int) {
        self.onClick = onClick
        self.onIndicator = onIndicator
        self.type = type
        self.tag = tag
    }
    
    func setup(cell: RequestVolunterTypeBaseCellView) {
        cell.checkBox?.setOn(self.isChecked, animated: false)
        cell.separatorView.isHidden = (self.expandedState == .collapsed)
        cell.typeIconView.image = icon
        cell.typeTitleLabel.text = title
        cell.onIndicatorTapped = {
            self.expandedState = (self.expandedState == .expanded) ? .collapsed : .expanded
            cell.separatorView.isHidden = (self.expandedState == .collapsed)
            switch self.expandedState {
            case .expanded:
                cell.animateRotation(fromValue: Double.pi, toValue: 0.0)
            case .collapsed:
                cell.animateRotation(fromValue: 0.0, toValue: Double.pi)
            }
            self.onIndicator?(self)
        }
        cell.onCheck = { isChecked in
            self.isChecked = isChecked
            self.onClick?(self)
        }
    }
    
    static func getCellHeight() -> CGFloat {
        return cellHeight
    }
}
