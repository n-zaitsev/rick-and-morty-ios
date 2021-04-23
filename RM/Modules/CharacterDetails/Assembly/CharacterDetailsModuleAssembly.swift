//
//  CharacterDetailsCharacterDetailsModuleAssembly.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Swinject

class CharacterDetailsModuleAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ModuleFactory<CharacterDetailsViewController>.self, name: CharacterDetailsViewController.className) { r in
            ModuleFactory<CharacterDetailsViewController>(handler: {
                r.resolve(CharacterDetailsViewController.self)!
            })
        }

        container.register(CharacterDetailsViewController.self) { r in
            let c: CharacterDetailsViewController = .fromStoryboard()

            c.viewModel = r.resolve(CharacterDetailsViewModel.self)

            return c
        }

        container.register(CharacterDetailsViewModel.self) { _ in
            let c = CharacterDetailsViewModel()

            return c
        }
    }
}
