//
//  ApplicationApplicationCoordinator.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import Foundation

class ApplicationCoordinator: BaseCoordinator {
    var characterListCoordinator: CharacterListCoordinator!
    override func start() {
        // Decoration part
        characterListCoordinator.start()
    }
}
