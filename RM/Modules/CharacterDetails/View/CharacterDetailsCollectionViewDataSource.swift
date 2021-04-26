//
//  CharacterDetailsCollectionViewDataSource.swift
//  RM
//
//  Created by Пользователь on 26.04.2021.
//

import UIKit

class CharacterDetailsCollectionViewDataSource: NSObject {
    private weak var collectionView: UICollectionView?
    private var models = [[CellConfigurator]]() {
        didSet {
            collectionView?.reloadData()
        }
    }

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

    func updateModels(_ models: [[CellConfigurator]]) {
        self.models = models
    }
}

extension CharacterDetailsCollectionViewDataSource: UICollectionViewDelegate {}

extension CharacterDetailsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section][indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIndentifier, for: indexPath) as? ConfigurableCollectionRow {
            return cell.configureWith(model)
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        models.count
    }
}
