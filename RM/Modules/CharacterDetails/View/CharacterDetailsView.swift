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
    private var goToCharactersListFromEpisode: ((String) -> Void)? {
        didSet {
            dataSource.updateGoToCharacterListFromEpisodeClosure(closure: goToCharactersListFromEpisode)
        }
    }

    private var goToCharactersListFromLocation: ((String) -> Void)? {
        didSet {
            dataSource.updateGoToCharactersListFromLocationClosure(closure: goToCharactersListFromLocation)
        }
    }

    func decorate() {
        // Decoration part
        configureNibs()
        configureDataSource()
        collectionView.collectionViewLayout = collectionViewLayout
    }

    var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            guard let section = CharacterDetailsSections(rawValue: sectionIndex) else { return nil }
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

    private func configureDataSource() {
        dataSource = CharacterDetailsCollectionViewDataSource(collectionView: collectionView)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }

    func updateGoToCharactersListFromEpisodeClosure(closure: ((String) -> Void)? = nil) {
        goToCharactersListFromEpisode = closure
    }

    func updateGoToCharactersListFromLocationClosure(closure: ((String) -> Void)? = nil) {
        goToCharactersListFromLocation = closure
    }

    func updateModels(_ models: [[CellConfigurator]]) {
        self.models = models
    }
}
