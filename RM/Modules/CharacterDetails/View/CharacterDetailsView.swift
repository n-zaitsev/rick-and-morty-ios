//
//  CharacterDetailsCharacterDetailsView.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterDetailsView: UIView {
    private var models = [[CellConfigurator]]() {
        didSet {
            dataSource.updateModels(models)
        }
    }

    @IBOutlet private var collectionView: UICollectionView!
    private var dataSource: CharacterDetailsCollectionViewDataSource!

    func decorate() {
        // Decoration part
        configureNibs()
        dataSource = CharacterDetailsCollectionViewDataSource(collectionView: collectionView)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
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
            case .location:
                return LocationCollectionViewCell.defaultSectionLayout(env: env)
            }
        }
    }

    private func configureNibs() {
        let headNib = UINib(nibName: HeadCollectionViewCell.className, bundle: nil)
        collectionView.register(headNib, forCellWithReuseIdentifier: HeadCharacterDetailsModel.className)

        let episodeNib = UINib(nibName: EpisodesCollectionViewCell.className, bundle: nil)
        collectionView.register(episodeNib, forCellWithReuseIdentifier: EpisodesCharacterDetailsModel.className)

        let locationNib = UINib(nibName: LocationCollectionViewCell.className, bundle: nil)
        collectionView.register(locationNib, forCellWithReuseIdentifier: LocationCharacterDetailsModel.className)
    }

    func updateModels(_ models: [[CellConfigurator]]) {
        self.models = models
    }
}
