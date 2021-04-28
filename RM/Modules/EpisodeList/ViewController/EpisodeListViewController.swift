//
//  EpisodeListEpisodeListViewController.swift
//  RMApp
//
//  Created by Nikita on 28/04/2021.
//  Copyright © 2021 Improve. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
    var viewModel: EpisodeListViewModel!
    @IBOutlet var rootView: EpisodeListView!
    var goToCharactersListFromEpisodes: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Decoration
        rootView.decorate()
        rootView.updateGoToCharactersListFromEpisodesClosure(closure: goToCharactersListFromEpisodes)
        bindToViewModel()
    }

    private func bindToViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.viewModelDidUpdate()
            self?.navigationItem.title = "Episodes"
        }

        viewModel.didError = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

    private func viewModelDidUpdate() {
        rootView.updateModel(models: viewModel.models)
    }
}
