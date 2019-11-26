//
//  CharacterListPresenter.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation

protocol CharacterListPresenter: class {
    init(view: CharacterListView)
    func refresh()
    func loadMore()
}
