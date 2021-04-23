//
//  HeadCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class HeadCharacterDetailsModel: NSObject, CellConfigurator {
    var name: String
    var portrait: String

    init(character: Character) {
        name = character.name
        portrait = character.image
    }
}
