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
            [ProgrammItemModel(img: Asset.mainLogo.image,
                               description: "!Участие в социализации воспитанников интернатных учреждений"),
             ProgrammItemModel(img: Asset.mainLogo.image,
                               description: "!Участие в социализации воспитанников интернатных учреждений"),
             ProgrammItemModel(img: Asset.mainLogo.image,
                               description: "!Участие в социализации воспитанников интернатных учреждений"),
             ProgrammItemModel(img: Asset.mainLogo.image,
                               description: "!Участие в социализации воспитанников интернатных учреждений")])
        result.append(programmsVM)
        
        let aboutInfoVM = AboutInfoCellViewModel()
        result.append(aboutInfoVM)
        
        let aboutSocialVM = AboutSocialCellViewModel(onSocial: { socialType in
            onSocial(socialType)
        })
        result.append(aboutSocialVM)
        return result
    }
}
