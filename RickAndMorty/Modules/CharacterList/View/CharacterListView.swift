//
//  CharacterLIstView.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation
import RickAndMortyAPI

protocol CharacterListView: class {
    // TODO, should CharacterData insted of the ModelCharacter
    func setCharacters(with data: [ModelCharacter])

    func startRefresh()
    func stopRefresh()

    func startLoadMore()
    func stopLoadMore()

    func networkErrorOccured()
}
