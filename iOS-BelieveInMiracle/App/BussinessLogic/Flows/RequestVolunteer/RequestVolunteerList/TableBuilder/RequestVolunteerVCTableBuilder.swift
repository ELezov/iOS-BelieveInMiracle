//
//  RequestVolunteerVCTableBuilder.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

final class RequestVolunteerVCTableBuilder:
RequestVolunteerVCTableBuilderAbstract {
    func map(_ completion: @escaping EmptyCompletion) -> [CellViewModel] {
        var result = [CellViewModel]()
        let selectHandler: EmptyCompletion = {
            completion()
        }
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.Volunteer.hospitalVolunteer.image,
                                                           title: L10n.Volunteer.Hospitalvolunteer.title,
                                                           description: L10n.Volunteer.Hospitalvolunteer.description))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.Volunteer.adressVolunteer.image,
                                                           title: L10n.Volunteer.Adressvolunteer.title,
                                                           description: L10n.Volunteer.Adressvolunteer.description))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.Volunteer.eventVolunteer.image,
                                                           title: L10n.Volunteer.Eventvolunteer.title,
                                                           description: L10n.Volunteer.Eventvolunteer.description))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.Volunteer.distanceVolunteer.image,
                                                           title: L10n.Volunteer.Distancevolunteer.title,
                                                           description: L10n.Volunteer.Distancevolunteer.description))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.Volunteer.clownTherapy.image,
                                                           title: L10n.Volunteer.Clowntherapy.title,
                                                           description: L10n.Volunteer.Clowntherapy.description))
        return result
    }
}
