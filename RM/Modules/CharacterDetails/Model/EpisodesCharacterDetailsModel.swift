//
//  EpisodesCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class EpisodesCharacterDetailsModel: NSObject, EpisodesCellConfigurator {
    var episodesIds: [String]
    var name: String

    init(name: String, episodesIds: [String]) {
        self.name = name
        self.episodesIds = episodesIds
    }
}
