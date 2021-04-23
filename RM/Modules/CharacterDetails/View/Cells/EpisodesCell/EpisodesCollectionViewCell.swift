//
//  EpisodesCollectionViewCell.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import UIKit

class EpisodesCollectionViewCell: UICollectionViewCell {
    static func defaultSectionLayout(env _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(150))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(160))
        let groupLayout = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                           subitems: [itemLayout])

        groupLayout.interItemSpacing = .flexible(10)
        groupLayout.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)

        let section = NSCollectionLayoutSection(group: groupLayout)
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var airDateLabel: UILabel!
}

//
// extension HeadCollectionViewCell: ConfigurableCollectionRow {
//    func configureWith(_ configurator: CellConfigurator) -> UICollectionViewCell {
//        if let configurator = configurator as? EpisodesCharacterDetailsModel {
//
//        }
//        return self
//    }
// }
