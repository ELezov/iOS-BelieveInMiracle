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
                                                           icon: Asset.hospitalVolunteer.image,
                                                           title: "Больничные волонтеры"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.adressVolunteer.image,
                                                           title: "Адресные волонтеры"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.eventVolunteer.image,
                                                           title: "Волонтеры мероприятий"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.distanceVolunteer.image,
                                                           title: "Дистанционные волонтеры"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.clownTherapy.image,
                                                           title: "Клоунотерапия"))
        return result
    }
}
