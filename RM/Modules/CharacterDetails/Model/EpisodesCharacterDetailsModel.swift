//
//  EpisodesCharacterDetailsModel.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import Foundation

class EpisodesCharacterDetailsModel: NSObject, EpisodeCellConfigurator {
    var episodeId: String
    var name: String
    var airDate: String

    init(episode: Episode) {
        name = episode.name
        airDate = episode.airDate
        episodeId = String(episode.id)
    }
}
