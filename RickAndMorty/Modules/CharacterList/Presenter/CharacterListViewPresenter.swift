//
//  CharacterListViewPresenter.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation
import RickAndMortyAPI

class CharacterListViewPresenter: CharacterListPresenter {

    private unowned let view: CharacterListView
    private var characters = [ModelCharacter]()
    private var currentPage = 0

    required init(view: CharacterListView) {
        self.view = view
    }

    func refresh() {
        currentPage = resetedPage()
        view.startRefresh()
        CharacterAPI.charactersGet(page: currentPage) { characterList, error in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.view.stopRefresh()
                guard error == nil else {
                    self.view.networkErrorOccured()
                    return
                }
                self.characters.removeAll()
                if let newCharacters = characterList?.results {
                    self.characters.append(contentsOf: newCharacters)
                }
                self.view.setCharacters(with: self.characters)
            }
        }
    }

    func loadMore() {
        currentPage = nextPage(for: currentPage)
        view.startLoadMore()
        CharacterAPI.charactersGet(page: currentPage) { characterList, error in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.view.stopLoadMore()
                guard error == nil else {
                    self.view.networkErrorOccured()
                    return
                }
                if let newCharacters = characterList?.results {
                    self.characters.append(contentsOf: newCharacters)
                }
                self.view.setCharacters(with: self.characters)
            }
        }
    }

    private func resetedPage() -> Int {
        return 0
    }

    private func nextPage(for page: Int) -> Int {
        return page + 1
    }
}
