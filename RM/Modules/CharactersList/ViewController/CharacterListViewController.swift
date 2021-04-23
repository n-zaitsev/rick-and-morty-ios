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
        rootView.decorate(goToDetailsClosure: goToDetails) { page in
            self.viewModel.getCharactersWithPage(page)
        }
        bindToViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    private func bindToViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
        }
    }

    private func viewModelDidUpdate() {
        rootView.updateModel(models: viewModel.models)
    }
}
