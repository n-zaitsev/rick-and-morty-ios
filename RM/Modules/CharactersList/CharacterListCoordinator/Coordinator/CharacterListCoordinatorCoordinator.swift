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
    var characterDetailsModuleFactory: ModuleFactory<CharacterDetailsViewController>!
    override func start() {
        // Decoration part
        characterListModuleFactory.produceRoot { vc in
            vc.goToDetails = { [self] model in
                self.openDetailsPage(from: vc, model: model)
            }
        }
    }

    private func openDetailsPage(from: UIViewController, model: CharacterCellConfigurator) {
        characterDetailsModuleFactory.defaultProduce(from: from, disableBackText: false) { _, cdvc in
            cdvc.viewModel.getCharacterDetails(model: model)
        }
    }
}
