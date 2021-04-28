//
//  CharacterListCharacterListViewController.swift
//  RMApp
//
//  Created by Nikita on 19/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    var viewModel: CharacterListViewModel!
    @IBOutlet var rootView: CharacterListView!
    var goToDetails: ((CharacterCellConfigurator) -> Void)?
    var getCharactersFromPage: ((String?) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Decoration
        rootView.decorate()
        rootView.updateGoToDetailsClosure(closure: goToDetails)
        rootView.updateGetCharacterFromPageClosure(closure: getCharactersFromPage)
        bindToViewModel()
    }

    private func bindToViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
            self?.navigationItem.title = self?.viewModel.models.title
        }

        viewModel.didError = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

    private func viewModelDidUpdate() {
        rootView.updateModel(models: viewModel.models)
    }
}
