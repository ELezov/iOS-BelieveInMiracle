//
//  RequestVolunteerVCTableBuilderAbstract.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 18.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation

protocol RequestVolunteerVCTableBuilderAbstract {
    /// Create view models
    ///
    func map(_ completion: @escaping RequestVolunterTypeBaseCellViewModel.OnClick,
             onCheck: @escaping RequestVolunterTypeBaseCellViewModel.OnClick) -> [RequestVolunterTypeBaseCellViewModel]
}
