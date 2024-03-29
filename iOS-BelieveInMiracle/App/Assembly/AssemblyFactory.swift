//
//  AssemblyFactory.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import Foundation
import Swinject

struct AssemblyFactory {
    
    func makeResolver() -> Resolver {
        let assembler = Assembler(
            [
                ApplicationAssembly(),
                CommonAssembly(),
                MainAssembly(),
                AboutAssembly(),
                DonateAssembly(),
                RequestVolunteerAssembly(),
                KidsAssembly()
            ]
        )
        return assembler.resolver
    }
}
