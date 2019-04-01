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
    func map(onSocial: @escaping SocialTypeCompletion,
             onOpenLink: @escaping OptionalStringCompletion) -> [CellViewModel] {
        var result = [CellViewModel]()
        
        let topVM = AboutTopCellViewModel(description: L10n.About.Top.title)
        result.append(topVM)
        
        let programmsVM = AboutProgrammsCellViewModel(
            onClick: onOpenLink,
            programms:
            [ProgrammItemModel(img: Asset.About.Programm.internat.image,
                               description: L10n.About.Program.Internat.name,
                               link: L10n.About.Program.Internat.link),
             ProgrammItemModel(img: Asset.About.Programm.games.image,
                               description: L10n.About.Program.Game.name,
                               link: L10n.About.Program.Game.link),
             ProgrammItemModel(img: Asset.About.Programm.grownvolunteer.image,
                               description: L10n.About.Program.Grownvolunteer.name,
                               link: L10n.About.Program.Grownvolunteer.name),
             ProgrammItemModel(img: Asset.About.Programm.social.image,
                               description: L10n.About.Program.Social.name,
                               link: L10n.About.Program.Social.link),
             ProgrammItemModel(img: Asset.About.Programm.address.image,
                               description: L10n.About.Program.Address.name,
                               link: L10n.About.Program.Address.link),
             ProgrammItemModel(img: Asset.About.Programm.modern.image,
                               description: L10n.About.Program.Modern.name,
                               link: L10n.About.Program.Modern.link),
             ProgrammItemModel(img: Asset.About.Programm.hospital.image,
                               description: L10n.About.Program.Hospital.name,
                               link: L10n.About.Program.Hospital.link)
             ], title: L10n.About.Programms.title)
        result.append(programmsVM)
        
        let projectsVM = AboutProgrammsCellViewModel(
            onClick: onOpenLink,
            programms:
            [ProgrammItemModel(img: Asset.About.Project.miraclion.image,
                               description: L10n.About.Project.Miraclion.name,
                               link: L10n.About.Project.Miraclion.link),
             ProgrammItemModel(img: Asset.About.Project.fruppololager.image,
                               description: L10n.About.Project.Fruppoloter.name,
                               link: L10n.About.Project.Fruppoloter.link),
             ProgrammItemModel(img: Asset.About.Project.fruppolohospis.image,
                               description: L10n.About.Project.Fruppolohospis.name,
                               link: L10n.About.Project.Fruppolohospis.link),
             ProgrammItemModel(img: Asset.About.Project.pobediteli.image,
                               description: L10n.About.Project.Pobediteli.name,
                               link: L10n.About.Project.Pobediteli.link)
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
