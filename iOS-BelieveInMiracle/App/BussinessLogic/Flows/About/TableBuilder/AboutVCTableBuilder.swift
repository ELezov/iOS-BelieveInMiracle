//
//  AboutVCTableBuilder.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

import UIKit

typealias SocialTypeCompletion = ((SocialType) -> Void)

enum SocialType {
    case vk
    case facebook
    case instagram
}

final class AboutVCTableBuilder:
AboutVCTableBuilderAbstract {
    func map(onSocial: @escaping SocialTypeCompletion) -> [CellViewModel] {
        var result = [CellViewModel]()
        
        let topVM = AboutTopCellViewModel(description: L10n.About.Top.title)
        result.append(topVM)
        
        let programmsVM = AboutProgrammsCellViewModel(programms:
            [ProgrammItemModel(img: Asset.About.Programm.internat.image,
                               description: L10n.About.Program.internat),
             ProgrammItemModel(img: Asset.About.Programm.games.image,
                               description: L10n.About.Program.game),
             ProgrammItemModel(img: Asset.About.Programm.grownvolunteer.image,
                               description: L10n.About.Program.grownvolunteer),
             ProgrammItemModel(img: Asset.About.Programm.social.image,
                               description: L10n.About.Program.social),
             ProgrammItemModel(img: Asset.About.Programm.address.image,
                               description: L10n.About.Program.address),
             ProgrammItemModel(img: Asset.About.Programm.modern.image,
                               description: L10n.About.Program.modern),
             ProgrammItemModel(img: Asset.About.Programm.hospital.image,
                               description: L10n.About.Program.hospital),
             ], title: L10n.About.Programms.title)
        result.append(programmsVM)
        
        let projectsVM = AboutProgrammsCellViewModel(programms:
            [ProgrammItemModel(img: Asset.About.Project.miraclion.image,
                               description: L10n.About.Project.miraclion),
             ProgrammItemModel(img: Asset.About.Project.fruppololager.image,
                               description: L10n.About.Project.fruppoloter),
             ProgrammItemModel(img: Asset.About.Project.fruppolohospis.image,
                               description: L10n.About.Project.fruppolohospis),
             ProgrammItemModel(img: Asset.About.Project.pogruzenie.image,
                               description: L10n.About.Project.pogruzenije),
             ], title: L10n.About.Project.title)
        result.append(projectsVM)
        
        let aboutInfoVM = AboutInfoCellViewModel()
        result.append(aboutInfoVM)
        
        let aboutSocialVM = AboutSocialCellViewModel(onSocial: { socialType in
            onSocial(socialType)
        })
        result.append(aboutSocialVM)
        
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let buildVersionNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        
            let appVersionString = "\(L10n.About.App.version)\(version).\(buildVersionNumber)"
            let appVersionVM = AppProductionCellViewModel(appVersion: appVersionString)
            result.append(appVersionVM)
        }
        
        return result
    }
}
