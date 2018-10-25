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
    
    func map(_ completion: @escaping EmptyCompletion,
             onCheck: @escaping RequestVolunterTypeBaseCellViewModel.OnClick) -> [CellViewModel] {
        var result = [CellViewModel]()
        let selectHandler: EmptyCompletion = {
            completion()
        }
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: selectHandler,
                                                           type: .hospital,
                                                           tag: 0))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: selectHandler,
                                                           type: .address,
                                                           tag: 1))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: selectHandler,
                                                           type: .event,
                                                           tag: 2))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: selectHandler,
                                                            type: .distance,
                                                           tag: 3))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: selectHandler,
                                                           type: .clown,
                                                           tag: 4))
        return result
    }
}
