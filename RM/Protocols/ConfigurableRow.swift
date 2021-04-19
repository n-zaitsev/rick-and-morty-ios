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
}

extension CellConfigurator {
    var reuseIndentifier: String {
        return Self.className
    }
}
