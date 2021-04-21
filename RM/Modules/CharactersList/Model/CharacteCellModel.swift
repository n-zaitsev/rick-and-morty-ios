//
//  CharacteCellModel.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Foundation

class CharacterCellModel: NSObject, CharacterCellConfigurator {
    var characterId: String
    var name: String
    var portrait: String
    var gender: String
    var species: String
    var status: String

    init(character: Character) {
        characterId = String(character.id)
        name = character.name
        portrait = character.image
        gender = character.gender.rawValue
        species = character.species.rawValue
        status = character.status.rawValue
    }
}
