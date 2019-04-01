//
//  AboutVCTableBuilderAbstract.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

protocol AboutVCTableBuilderAbstract {
    /// Create view models
    ///
    func map(onSocial: @escaping SocialTypeCompletion,
             onOpenLink: @escaping OptionalStringCompletion) -> [CellViewModel]
}
