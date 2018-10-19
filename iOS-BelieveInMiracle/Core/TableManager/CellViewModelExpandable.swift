//
//  CellViewModelExpandable.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 19.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit

enum ExpandableState {
    case expanded
    case collapsed
}

protocol CellViewModelExpandable {
    var expandedState: ExpandableState { get set }
}
