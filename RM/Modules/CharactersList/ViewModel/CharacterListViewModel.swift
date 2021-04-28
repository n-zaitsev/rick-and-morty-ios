//
//  CharacterListCharacterListViewModel.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class CharacterListViewModel: NSObject {
    var models = CharacterSectionModel(title: "All characters", characters: [], nextPage: "1")

    var didUpdate: (() -> Void)?
    var didError: (() -> Void)?

    func getCharactersWithPage(_ page: String?) {
        CharacterAPIClient.getCharactersWithPage(page) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(characterResponse):
                let characters = characterResponse.results
                if let page = characterResponse.info.next.split(separator: "/").last?.split(separator: "=").last {
                    self.models.nextPage = String(page)
                }
                self.models.characters.append(contentsOf: characters.map { character -> CharacterCellConfigurator in
                    CharacterCellModel(character: character)
                })
                self.didUpdate?()
            }
        }
    }

    func getCharactersFromEpisode(_ episodeId: String) {
        var charactersIds = [String]()
        CharacterDetailsAPIClient.getEpisodeWithId(episodeId) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
                self.didError?()
            case let .success(episode):
                charactersIds = episode.characters.map { characterUrl -> String in
                    characterUrl.getCharacterIdFromUrl()
                }
                CharacterAPIClient.getCharactersWithIds(charactersIds) { result in
                    switch result {
                    case let .failure(error):
                        print(error.localizedDescription)
                        self.didError?()
                    case let .success(characterResponse):
                        self.models.title = episode.name
                        self.models.nextPage = nil
                        self.models.characters = characterResponse.map { character -> CharacterCellConfigurator in
                            CharacterCellModel(character: character)
                        }
                        self.didUpdate?()
                    }
                }
            }
        }
    }

    func getCharactersFromLocation(_ id: String) {
        var charactersIds = [String]()
        CharacterDetailsAPIClient.getLocationWithId(id) { result in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
                self.didError?()
            case let .success(location):
                charactersIds = location.residents.map { characterUrl -> String in
                    characterUrl.getCharacterIdFromUrl()
                }
                CharacterAPIClient.getCharactersWithIds(charactersIds) { result in
                    switch result {
                    case let .failure(error):
                        print(error.localizedDescription)
                        self.didError?()
                    case let .success(characterResponse):
                        self.models.title = location.name
                        self.models.nextPage = nil
                        self.models.characters = characterResponse.map { character -> CharacterCellConfigurator in
                            CharacterCellModel(character: character)
                        }
                        self.didUpdate?()
                    }
                }
            }
        }
    }
}
