//
//  EpisodeListTableViewDataSource.swift
//  RM
//
//  Created by Импрув on 28.04.2021.
//

import UIKit

class EpisodeListTableViewDataSource: NSObject {
    private var models = [CellConfigurator]()
    private weak var tableView: UITableView?
    private var goToCharactersListFromEpisodes: ((String) -> Void)?
    init(tableView: UITableView) {
        self.tableView = tableView
    }

    func updateModels(models: [CellConfigurator]) {
        self.models = models
        tableView?.reloadData()
    }

    func updateGoToCharactersListFromEpisodesClosure(closure: ((String) -> Void)?) {
        goToCharactersListFromEpisodes = closure
    }
}

extension EpisodeListTableViewDataSource: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let model = models[indexPath.row] as? EpisodeCellConfigurator {
            goToCharactersListFromEpisodes?(model.episodeId)
        }
    }
}

extension EpisodeListTableViewDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        models.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        if let cell = tableView?.dequeueReusableCell(withIdentifier: model.reuseIndentifier) as? ConfigurableRow {
            return cell.configureWith(model)
        }
        return UITableViewCell()
    }
}
