//
//  CharacterTableViewCell.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Kingfisher
import UIKit

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet private var portraitImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var genderImageView: UIImageView!
    @IBOutlet private var speciesImageView: UIImageView!
}

extension CharacterTableViewCell: ConfigurableRow {
    func configureWith(_ configurator: CellConfigurator) -> UITableViewCell {
        guard
            let configurator = configurator as? CharacterCellModel
        else { return UITableViewCell() }
        portraitImageView.kf.setImage(with: URL(string: configurator.portrait),
                                      placeholder: UIImage(named: "PlaceholderImage"))
        nameLabel.text = configurator.name
        genderImageView.image = UIImage(named: configurator.gender)
        speciesImageView.image = UIImage(named: configurator.species)
        return self
    }
}
