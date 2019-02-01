//
//  String + Extensions.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 17/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    public var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

extension String {
    public var nilIfEmpty: String? {
        return self.isEmpty ? nil : self
    }
}
