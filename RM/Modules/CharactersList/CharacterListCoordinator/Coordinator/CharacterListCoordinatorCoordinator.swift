//
//  CharacterListCoordinator.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterListCoordinator: BaseCoordinator {
    var characterListModuleFactory: ModuleFactory<CharacterListViewController>!
    override func start() {
        // Decoration part
        characterListModuleFactory.produceRoot { vc in
            vc.goToDetails = { [self] model in
                self.openDetailsPage(from: vc, model: model)
            }
        }
    }

    private func openDetailsPage(from _: UIViewController, model _: CellConfigurator) {
//        contactDetailsModuleFactory.defaultProduce(from: from, disableBackText: false) { _, cvc in
//            cvc.viewModel.getCharacterDetails(id: model.characterId, episodes: model.episodes)
//        }
    }
}
