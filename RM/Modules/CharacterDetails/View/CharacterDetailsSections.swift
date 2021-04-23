//
//  CharacterDetailsSections.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import UIKit

enum ContactsDetailsSections: Int, CaseIterable {
    case head
    case episodes
    case profile

    var columnCount: Int {
        switch self {
        case .head:
            return 0
        case .profile:
            return 1
        case .episodes:
            return 2
        }
    }
}
