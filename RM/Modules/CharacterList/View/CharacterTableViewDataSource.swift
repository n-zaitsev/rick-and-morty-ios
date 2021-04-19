//
//  CharacterTableViewDataSource.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Foundation

import UIKit

class CharacterTableViewDataSource: NSObject {
    private var models = CharacterSectionModel(characters: [], nextPage: "1")
    private weak var tableView: UITableView?
    var goToDetails: ((CellConfigurator) -> Void)?
    var getCharactersFromPage: ((String) -> Void)?
    init(tableView: UITableView,
         goToDetailsClosure: ((CellConfigurator) -> Void)? = nil,
         getCharactersFromPage: ((String) -> Void)? = nil)
    {
        self.tableView = tableView
        self.getCharactersFromPage = getCharactersFromPage
        goToDetails = goToDetailsClosure
    }

    func updateModel(models: CharacterSectionModel) {
        self.models = models
    }
}

extension CharacterTableViewDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        models.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let count = models.characters.count
        if count > 1 {
            let lastElement = count - 1
            if indexPath.row == lastElement {
                getCharactersFromPage?(models.nextPage)
            }
        }

        let cellModel = models.characters[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.reuseIndentifier) as? ConfigurableRow {
            return cell.configureWith(cellModel)
        }
        return UITableViewCell()
    }
}

extension CharacterTableViewDataSource: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models.characters[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        goToDetails?(model)
    }
}
