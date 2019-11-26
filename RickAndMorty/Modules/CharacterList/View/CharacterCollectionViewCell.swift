//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import UIKit
import RickAndMortyAPI

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var name: UILabel?

    @IBOutlet private weak var species: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with data: ModelCharacter) {
        self.name?.text = data.name
        self.species?.text = data.species
    }
}
