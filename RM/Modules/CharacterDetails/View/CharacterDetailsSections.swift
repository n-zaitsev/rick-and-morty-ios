//
//  CharacterDetailsSections.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import UIKit

enum CharacterDetailsSections: Int, CaseIterable {
    case head
    case location
    case episodes

    var columnCount: Int {
        switch self {
        case .head:
            return 0
        case .location:
            return 1
        case .episodes:
            return 2
        }
    }
}
