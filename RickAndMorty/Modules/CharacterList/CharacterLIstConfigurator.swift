//
//  CharacterLIstConfigurator.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation
import UIKit
import RickAndMortyAPI

final class CharacterListConfigurator {
    func configure() -> UIViewController {

        guard let view = UIStoryboard(name: String(describing: CharacterListViewController.self),
                                      bundle: Bundle.main)
            .instantiateInitialViewController() as? CharacterListViewController
                    else {
                        fatalError("""
        Can't load CharacterListViewController from storyboard,
        check that controller is initial view controller
        """)
        }
        let presenter = CharacterListViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
