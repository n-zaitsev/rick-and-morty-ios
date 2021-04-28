//
//  HeadCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class HeadCharacterDetailsModel: NSObject, CellConfigurator {
    var portrait: String
    var species: String
    var gender: String
    var status: String

    init(character: Character) {
        portrait = character.image
        gender = character.gender.rawValue
        status = character.status.rawValue
        species = character.species.rawValue
    }
}
