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
    
    func map(_ completion: @escaping RequestVolunterTypeBaseCellViewModel.OnClick,
             onCheck: @escaping RequestVolunterTypeBaseCellViewModel.OnClick)
        -> [RequestVolunterTypeBaseCellViewModel] {
        var result = [RequestVolunterTypeBaseCellViewModel]()
    
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: completion,
                                                           type: .hospital,
                                                           tag: 0))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: completion,
                                                           type: .address,
                                                           tag: 1))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: completion,
                                                           type: .event,
                                                           tag: 2))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: completion,
                                                            type: .distance,
                                                           tag: 3))
        result.append(RequestVolunterTypeBaseCellViewModel(onClick: onCheck,
                                                           onIndicator: completion,
                                                           type: .clown,
                                                           tag: 4))
        return result
    }
}
