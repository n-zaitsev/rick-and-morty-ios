//
//  CharacterDetailsCharacterDetailsViewController.swift
//  RMApp
//
//  Created by Nikita on 23/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    var viewModel: CharacterDetailsViewModel!
    @IBOutlet var rootView: CharacterDetailsView!
    var goToEpisodesListFromDetails: (([String]) -> Void)?
    var goToCharactersListFromDetails: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Decoration
        rootView.decorate()
        rootView.updateGoToEpisodesListFromDetailsClosure(closure: goToEpisodesListFromDetails)
        rootView.updateGoToCharactersListFromLocationClosure(closure: goToCharactersListFromDetails)
        bindToViewModel()
    }

    private func bindToViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
            self?.navigationItem.title = self?.viewModel.model.name
        }
    }

    private func viewModelDidUpdate() {
        rootView.updateModels(viewModel.model)
    }
}
