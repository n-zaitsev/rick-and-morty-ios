//
//  ConfigurableRow.swift
//  School
//
//  Created by Nikita Zaitsev on 26.03.2021.
//

import UIKit

protocol ConfigurableRow: UITableViewCell {
    func configureWith(_ configurator: CellConfigurator) -> UITableViewCell
}

protocol CellConfigurator: NSObject {
    var reuseIndentifier: String { get }
}

protocol CharacterCellConfigurator: CellConfigurator {
    var characterId: String { get }
    var episodesId: [String] { get }
}

protocol EpisodeCellConfigurator: CellConfigurator {
    var episodeId: String { get }
}

protocol LocationCellConfigurator: CellConfigurator {
    var locationId: String { get }
}

protocol ConfigurableCollectionRow: UICollectionViewCell {
    func configureWith(_ configurator: CellConfigurator) -> UICollectionViewCell
}

extension CellConfigurator {
    var reuseIndentifier: String {
        return Self.className
    }
}
