//
//  CharacterTableViewDataSource.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import Foundation

import UIKit

class CharacterTableViewDataSource: NSObject {
    private var models = CharacterSectionModel(title: "All characters", characters: [], nextPage: "1")
    private weak var tableView: UITableView?
    var goToDetails: ((CharacterCellConfigurator) -> Void)?
    var getCharactersFromPage: ((String?) -> Void)?

    init(tableView: UITableView) {
        self.tableView = tableView
    }

    func updateGoToDetailsClosure(goToDetails: ((CharacterCellConfigurator) -> Void)? = nil) {
        self.goToDetails = goToDetails
    }

    func updateGetCharacterFromPageClosure(getCharactersFromPage: ((String?) -> Void)? = nil) {
        self.getCharactersFromPage = getCharactersFromPage
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
            if let nextPage = models.nextPage,
               indexPath.row == lastElement
            {
                getCharactersFromPage?(nextPage)
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
