//
//  CharacterListViewPresenter.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation

class CharacterListViewPresenter: CharacterListPresenter {

    private unowned let view: CharacterListView
    private var currentPage = 0

    required init(view: CharacterListView) {
        self.view = view
    }

    func refresh() {
        currentPage = resetedPage()

    }

    func loadMore() {
        currentPage = nextPage(for: currentPage)
    }

    private func resetedPage() -> Int {
        return 0
    }

    private func nextPage(for page: Int) -> Int {
        return page + 1
    }
}
