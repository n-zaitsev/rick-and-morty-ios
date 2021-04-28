//
//  EpisodeTableViewCell.swift
//  RM
//
//  Created by Импрув on 28.04.2021.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var airDateLabel: UILabel!
}

extension EpisodeTableViewCell: ConfigurableRow {
    func configureWith(_ configurator: CellConfigurator) -> UITableViewCell {
        if let configurator = configurator as? EpisodeCellModel {
            nameLabel.text = configurator.name
            airDateLabel.text = configurator.airDate
            return self
        }
        return UITableViewCell()
    }
}
