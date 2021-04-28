//
//  EpisodeListEpisodeListViewModel.swift
//  RMApp
//
//  Created by Nikita on 28/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class EpisodeListViewModel: NSObject {
    var models = [CellConfigurator]()
    var didError: (() -> Void)?
    var didUpdate: (() -> Void)?

    func getEpisodesWithIds(_ episodesIds: [String]) {
        EpisodeListAPIClient.getEpisodesWithIds(episodesIds) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(episodes):
                self.models = episodes.map { episode -> CellConfigurator in
                    EpisodeCellModel(episode: episode)
                }
                self.didUpdate?()
            }
        }
    }
}
