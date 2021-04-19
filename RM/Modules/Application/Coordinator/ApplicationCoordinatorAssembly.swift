//
//  ApplicationApplicationCoordinatorAssembly.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Swinject
import UIKit

class ApplicationCoordinatorAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ApplicationCoordinator.self) { r in
            let c = ApplicationCoordinator()
            c.characterListCoordinator = r.resolve(CharacterListCoordinator.self)
            return c
        }
    }
}
