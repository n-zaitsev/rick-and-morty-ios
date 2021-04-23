//
//  CharacterListCoordinatorCharacterListCoordinatorCoordinatorAssembly.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Swinject
import UIKit

class CharacterListCoordinatorAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(CharacterListCoordinator.self) { r in
            let c = CharacterListCoordinator()
            c.characterListModuleFactory = r.resolveController(CharacterListViewController.self)
            c.characterDetailsModuleFactory = r.resolveController(CharacterDetailsViewController.self)
            return c
        }
    }
}
