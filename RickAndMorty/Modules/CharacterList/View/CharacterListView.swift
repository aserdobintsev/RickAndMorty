//
//  CharacterLIstView.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import Foundation

protocol CharacterListView: class {
    func startRefresh()
    func stopRefresh()

    func startLoadMore()
    func stopLoadMore()

    
    func networkErrorOccured()
}
