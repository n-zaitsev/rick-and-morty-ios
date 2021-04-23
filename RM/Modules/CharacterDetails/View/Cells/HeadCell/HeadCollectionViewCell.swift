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
                                              heightDimension: .estimated(50))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(160))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                             subitems: [itemLayout])

        groupLayout.interItemSpacing = .flexible(10)
        groupLayout.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)

        return NSCollectionLayoutSection(group: groupLayout)
    }

    @IBOutlet private var nameLabel: UILabel!

    @IBOutlet private var portraitImageView: UIImageView!
}

extension HeadCollectionViewCell: ConfigurableCollectionRow {
    func configureWith(_ configurator: CellConfigurator) -> UICollectionViewCell {
        if let configurator = configurator as? HeadCharacterDetailsModel {
            portraitImageView.kf.setImage(with: URL(string: configurator.portrait),
                                          placeholder: UIImage(named: "PlaceholderImage"))
            nameLabel.text = configurator.name
        }
        return self
    }
}
