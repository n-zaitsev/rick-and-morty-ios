//
//  CharacterDetailsCharacterDetailsView.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterDetailsView: UIView {
    private var models = [[CellConfigurator]]()

    @IBOutlet private var collectionView: UICollectionView!

    func decorate() {
        // Decoration part
        configureNibs()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionViewLayout
    }

    var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            guard let section = ContactsDetailsSections(rawValue: sectionIndex) else { return nil }
            switch section {
            case .head:
                return HeadCollectionViewCell.defaultSectionLayout(env: env)
            case .episodes:
                return EpisodesCollectionViewCell.defaultSectionLayout(env: env)
            case .profile:
                return ProfileCollectionViewCell.defaultSectionLayout(env: env)
            }
        }
    }

    private func configureNibs() {
        let headNib = UINib(nibName: HeadCollectionViewCell.className, bundle: nil)
        collectionView.register(headNib, forCellWithReuseIdentifier: HeadCharacterDetailsModel.className)

        let episodeNib = UINib(nibName: EpisodesCollectionViewCell.className, bundle: nil)
        collectionView.register(episodeNib, forCellWithReuseIdentifier: EpisodesCharacterDetailsModel.className)

        let profileNib = UINib(nibName: ProfileCollectionViewCell.className, bundle: nil)
        collectionView.register(profileNib, forCellWithReuseIdentifier: LocationCharacterDetailsModel.className)
    }

    func updateModels(_ models: [[CellConfigurator]]) {
        self.models = models
        collectionView.reloadData()
    }
}

extension CharacterDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].count
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section][indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIndentifier, for: indexPath) as? ConfigurableCollectionRow {
            return cell.configureWith(model)
        }
        return UICollectionViewCell()
    }
}
