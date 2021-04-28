//
//  HeadCollectionViewCell.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import UIKit

class HeadCollectionViewCell: UICollectionViewCell {
    static func defaultSectionLayout(env _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.5))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                             subitems: [itemLayout])

        groupLayout.interItemSpacing = .flexible(0)
        groupLayout.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        return NSCollectionLayoutSection(group: groupLayout)
    }

    @IBOutlet private var portraitImageView: UIImageView!
    @IBOutlet private var speciesLabel: UILabel!
    @IBOutlet private var speciesNameLabel: UILabel!
    @IBOutlet private var genderLabel: UILabel!
    @IBOutlet private var genderNameLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var statusNameLabel: UILabel!
}

extension HeadCollectionViewCell: ConfigurableCollectionRow {
    func configureWith(_ configurator: CellConfigurator) -> UICollectionViewCell {
        if let configurator = configurator as? HeadCharacterDetailsModel {
            portraitImageView.kf.setImage(with: URL(string: configurator.portrait),
                                          placeholder: UIImage(named: "PlaceholderImage"))
            speciesLabel.text = "Species"
            genderLabel.text = "Gender"
            statusLabel.text = "Status"
            genderNameLabel.text = configurator.gender
            statusNameLabel.text = configurator.status
            speciesNameLabel.text = configurator.species
        }
        return self
    }
}
