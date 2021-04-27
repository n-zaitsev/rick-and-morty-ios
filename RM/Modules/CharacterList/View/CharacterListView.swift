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
    var goToDetails: ((CharacterCellConfigurator) -> Void)? {
        didSet {
            dataSource.updateGoToDetailsClosure(goToDetails: goToDetails)
        }
    }

    var getCharactersFromEpisode: ((String) -> Void)? {
        didSet {}
    }

    var getCharactersFromPage: ((String?) -> Void)? {
        didSet {
            dataSource.updateGetCharacterFromPageClosure(getCharactersFromPage: getCharactersFromPage)
        }
    }

    func decorate() {
        // Decoration part
        configureDataSource()
        configureCells()
    }

    func updateModel(models: CharacterSectionModel) {
        dataSource.updateModel(models: models)
        tableView.reloadData()
    }

    func updateGoToDetailsClosure(closure: ((CharacterCellConfigurator) -> Void)? = nil) {
        goToDetails = closure
    }

    func updateGetCharacterFromPageClosure(closure: ((String?) -> Void)? = nil) {
        getCharactersFromPage = closure
    }

    func updateGetCharactersFromEpisodeClosure(closure: ((String) -> Void)? = nil) {
        getCharactersFromEpisode = closure
    }

    private func configureDataSource() {
        dataSource = CharacterTableViewDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }

    func configureCells() {
        let characterCellNib = UINib(nibName: CharacterTableViewCell.className, bundle: nil)
        tableView.register(characterCellNib, forCellReuseIdentifier: CharacterCellModel.className)
    }
}
