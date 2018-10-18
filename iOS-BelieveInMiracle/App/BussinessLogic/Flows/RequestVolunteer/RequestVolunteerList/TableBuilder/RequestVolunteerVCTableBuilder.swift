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
        var selectHandler: EmptyCompletion = { [weak self] in
            completion()
        }
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.clownTherapy.image,
                                                           title: "Терапия"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.clownTherapy.image,
                                                           title: "ТерапияТерапияТерапияТерапияТерапияТерапия"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.clownTherapy.image,
                                                           title: "Терапия"))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: nil,
                                                           onIndicator: selectHandler,
                                                           icon: Asset.clownTherapy.image,
                                                           title: "Терапия"))
        return result
    }
}
