//
//  CharacterDetailsCharacterDetailsViewModel.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel: NSObject {
    var model = SectionDetailsModels(name: "", models: [[CellConfigurator]]())

    var didUpdate: (() -> Void)?

    override init() {
        super.init()
    }

    public func getCharacterDetails(model: CharacterCellConfigurator) {
        let group = DispatchGroup()
        var head = [CellConfigurator]()
        var episodes = [CellConfigurator]()
        var location = [CellConfigurator]()
        var title = ""
        group.enter()
        CharacterDetailsAPIClient.getCharacterWithId(model.characterId) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(character):
                title = character.name
                let headCell = HeadCharacterDetailsModel(character: character)
                head.append(headCell)
                let origin = LocationCharacterDetailsModel(location: character.origin,
                                                           headerName: "Origin location")
                let lastSeenLocation = LocationCharacterDetailsModel(location: character.location,
                                                                     headerName: "Last seen location")
                location = [origin, lastSeenLocation]
            }
            group.leave()
        }
        episodes.append(EpisodesCharacterDetailsModel(name: "Episodes", episodesIds: model.episodesId))
        group.notify(queue: DispatchQueue.main) {
            self.model.name = title
            self.model.models = [head, location, episodes]
            self.didUpdate?()
        }
    }
}
