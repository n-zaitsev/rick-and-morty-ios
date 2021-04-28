//
//  EpisodeListEpisodeListView.swift
//  RMApp
//
//  Created by Nikita on 28/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class EpisodeListView: UIView {
    @IBOutlet private var tableView: UITableView!
    private var dataSource: EpisodeListTableViewDataSource!

    func decorate() {
        // Decoration part
        configureDataSource()
        configureCells()
    }

    private func configureDataSource() {
        dataSource = EpisodeListTableViewDataSource(tableView: tableView)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    func configureCells() {
        let episodeCellNib = UINib(nibName: EpisodeTableViewCell.className, bundle: nil)
        tableView.register(episodeCellNib, forCellReuseIdentifier: EpisodeCellModel.className)
    }

    func updateGoToCharactersListFromEpisodesClosure(closure: ((String) -> Void)?) {
        dataSource.updateGoToCharactersListFromEpisodesClosure(closure: closure)
    }

    func updateModel(models: [CellConfigurator]) {
        dataSource.updateModels(models: models)
    }
}
