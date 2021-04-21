//
//  CharacterListCharacterListViewModel.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class CharacterListViewModel: NSObject {
    var models = CharacterSectionModel(characters: [], nextPage: "1") {
        didSet {
            didUpdate?()
        }
    }

    override init() {
        super.init()
        getCharactersWithPage(models.nextPage ?? "1")
    }

    var didUpdate: (() -> Void)?

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
                self.models.characters.append(contentsOf: characters.map { character -> CellConfigurator in
                    CharacterCellModel(character: character)
                })
            }
        }
    }
}
