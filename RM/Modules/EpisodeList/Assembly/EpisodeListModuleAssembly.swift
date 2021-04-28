//
//  EpisodeListEpisodeListModuleAssembly.swift
//  RMApp
//
//  Created by Nikita on 28/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Swinject

class EpisodeListModuleAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ModuleFactory<EpisodeListViewController>.self, name: EpisodeListViewController.className) { r in
            ModuleFactory<EpisodeListViewController>(handler: {
                r.resolve(EpisodeListViewController.self)!
            })
        }

        container.register(EpisodeListViewController.self) { r in
            let c: EpisodeListViewController = .fromStoryboard()

            c.viewModel = r.resolve(EpisodeListViewModel.self)

            return c
        }

        container.register(EpisodeListViewModel.self) { _ in
            let c = EpisodeListViewModel()

            return c
        }
    }
}
