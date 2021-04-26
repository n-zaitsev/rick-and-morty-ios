//
//  CharacterDetailsCharacterDetailsViewModel.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel: NSObject {
    var models: [[CellConfigurator]] = [] {
        didSet {
            didUpdate?()
        }
    }

    var didUpdate: (() -> Void)?

    override init() {
        super.init()
    }

    public func getCharacterDetails(model: CharacterCellConfigurator) {
        let group = DispatchGroup()
        var head = [CellConfigurator]()
        var episodes = [CellConfigurator]()
        var location = [CellConfigurator]()
        group.enter()
        CharacterDetailsAPIClient.getCharacterWithId(model.characterId) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(character):
                let headCell = HeadCharacterDetailsModel(character: character)
                head.append(headCell)
                let origin = LocationCharacterDetailsModel(location: character.origin, headerName: "First seen")
                let lastSeenLocation = LocationCharacterDetailsModel(location: character.location, headerName: "Last seen")
                location = [origin, lastSeenLocation]
            }
            group.leave()
        }
        group.enter()
        CharacterDetailsAPIClient.getEpisodesWithIds(model.episodesId) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(episodesDetails):
                episodes = episodesDetails.map { episode -> CellConfigurator in
                    EpisodesCharacterDetailsModel(episode: episode)
                }
            }
            group.leave()
        }
        group.notify(queue: DispatchQueue.main) {
            self.models = [head, location, episodes]
        }
    }
}
