//
//  CharacterListCharacterListModuleAssembly.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Swinject

class CharacterListModuleAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ModuleFactory<CharacterListViewController>.self, name: CharacterListViewController.className) { r in
            ModuleFactory<CharacterListViewController>(handler: {
                r.resolve(CharacterListViewController.self)!
            })
        }

        container.register(CharacterListViewController.self) { r in
            let c: CharacterListViewController = .fromStoryboard()

            c.viewModel = r.resolve(CharacterListViewModel.self)

            return c
        }

        container.register(CharacterListViewModel.self) { _ in
            let c = CharacterListViewModel()

            return c
        }
    }
}
