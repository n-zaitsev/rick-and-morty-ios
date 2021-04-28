//
//  EpisodeCellModel.swift
//  RM
//
//  Created by Импрув on 28.04.2021.
//

import Foundation

class EpisodeCellModel: NSObject, EpisodeCellConfigurator {
    var episodeId: String
    var name: String
    var airDate: String
    init(episode: Episode) {
        episodeId = String(episode.id)
        name = episode.name
        airDate = episode.airDate
    }
}
