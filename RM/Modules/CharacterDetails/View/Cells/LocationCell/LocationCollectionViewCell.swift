//
//  ProfileCollectionViewCell.swift
//  RM
//
//  Created by Импрув on 23.04.2021.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    static func defaultSectionLayout(env _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.1))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                             subitems: [itemLayout])

        groupLayout.interItemSpacing = .flexible(10)
        groupLayout.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        let sectionLayout = NSCollectionLayoutSection(group: groupLayout)
        return sectionLayout
    }

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var headerNameLabel: UILabel!
}

extension LocationCollectionViewCell: ConfigurableCollectionRow {
    func configureWith(_ configurator: CellConfigurator) -> UICollectionViewCell {
        if let configurator = configurator as? LocationCharacterDetailsModel {
            nameLabel.text = configurator.name
            headerNameLabel.text = configurator.headerName
        }
        return self
    }
}
