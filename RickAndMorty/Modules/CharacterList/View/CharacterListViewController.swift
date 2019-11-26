//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import UIKit
import RickAndMortyAPI
private let reuseIdentifier = "Cell"

class CharacterListViewController: UICollectionViewController {
    private let itemsPerRow: CGFloat = 1
    private let itemHeight: CGFloat = 100
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    var presenter: CharacterListPresenter?
    private var charactersData = [ModelCharacter]()

    private var reuseIdentifier = "CharacterCellViewId"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rick And Morty Characters"
        collectionView.delegate = self
        collectionView.dataSource = self
        self.registerCollectionContent()
        configurePullToRefresh()
        configurePagination()

        refreshData()
    }

    private func registerCollectionContent() {
        self.collectionView?.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    private func configurePullToRefresh() {
        self.collectionView.alwaysBounceVertical = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }

    private func configurePagination() {

    }

    @objc
    private func refreshData() {
        presenter?.refresh()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {

        return charactersData.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if let cell = cell as? CharacterCollectionViewCell {
            cell.configure(with: charactersData[indexPath.row])
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //presenter?.showDetails(for: data[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingSpace = (sectionInsets.left + sectionInsets.right) * itemsPerRow
        let widthPerItem = (collectionView.bounds.width - paddingSpace) / itemsPerRow
        return CGSize(width: widthPerItem, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

}

extension CharacterListViewController: CharacterListView {
    func setCharacters(with data: [ModelCharacter]) {
        charactersData = data
        collectionView.reloadData()
    }

    func startRefresh() {
        self.collectionView.refreshControl?.beginRefreshing()
    }

    func stopRefresh() {
        self.collectionView.refreshControl?.endRefreshing()
        self.collectionView.setContentOffset(CGPoint.zero, animated: true)
    }

    func startLoadMore() {

    }

    func stopLoadMore() {

    }

    func networkErrorOccured() {

    }
}
