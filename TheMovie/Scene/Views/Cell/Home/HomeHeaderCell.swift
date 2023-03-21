//
//  HomeHeaderCell.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//


import UIKit

class HomeHeaderCell: UICollectionReusableView,ReuseProtocol,NibProtocol {
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var viewBottom: UIView!
    
    var items = [MovieResult]()
    
    override func layoutSubviews() {
        collection.registerCell(type: VerticalMovieCell.self)
    }
    
    func configure(data: [MovieResult]) {
        items = data
        collection.reloadData()
    }
}

extension HomeHeaderCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VerticalMovieCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 143 / 375
        let height = collectionView.frame.height * 283 / 812
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
