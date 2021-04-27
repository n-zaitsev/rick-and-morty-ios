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
    var goToCharactersListFromEpisode: ((String) -> Void)?
    var goToCharactersListFromLocation: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Decoration
        rootView.decorate()
        rootView.updateGoToCharactersListFromEpisodeClosure(closure: goToCharactersListFromEpisode)
        rootView.updateGoToCharactersListFromLocationClosure(closure: goToCharactersListFromLocation)
        bindToViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    private func bindToViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
        }
    }

    private func viewModelDidUpdate() {
        rootView.updateModels(viewModel.models)
    }
}
