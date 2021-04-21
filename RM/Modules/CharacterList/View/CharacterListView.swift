//
//  CharacterListCharacterListView.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterListView: UIView {
    @IBOutlet private var tableView: UITableView!
    private var dataSource: CharacterTableViewDataSource!
    var goToDetails: ((CellConfigurator) -> Void)?
    var getCharactersFromPage: ((String?) -> Void)?

    func decorate(goToDetailsClosure: ((CellConfigurator) -> Void)? = nil, getCharactersFromPage: ((String?) -> Void)? = nil) {
        // Decoration part
        goToDetails = goToDetailsClosure
        self.getCharactersFromPage = getCharactersFromPage
        configureDataSource()
        configureCells()
    }

    func updateModel(models: CharacterSectionModel) {
        dataSource.updateModel(models: models)
        tableView.reloadData()
    }

    private func configureDataSource() {
        dataSource = CharacterTableViewDataSource(tableView: tableView,
                                                  goToDetailsClosure: goToDetails,
                                                  getCharactersFromPage: getCharactersFromPage)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }

    func configureCells() {
        let characterCellNib = UINib(nibName: CharacterTableViewCell.className, bundle: nil)
        tableView.register(characterCellNib, forCellReuseIdentifier: CharacterCellModel.className)
    }
}
