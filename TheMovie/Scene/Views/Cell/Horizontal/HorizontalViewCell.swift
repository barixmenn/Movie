//
//  HorizontalViewCell.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import UIKit
import SDWebImage

protocol MovieCellProtocol {
    var posterImage: String { get }
    var titleText: String { get }
    var ratingText: String { get }
    var genreItems: [String] { get }
    var overViewText: String { get }
}

class HorizontalViewCell: UICollectionViewCell, ReuseProtocol, NibProtocol {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var overViewLabel: UILabel!
    
    @IBOutlet private weak var collectionTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var collectionHeightConstraint: NSLayoutConstraint!
    var items = [String]()
    
    func configure(data: MovieCellProtocol) {
        titleLabel.text = data.titleText
        ratingLabel.text = data.ratingText
        movieImage.loadURL(url: data.posterImage)
        overViewLabel.text = data.overViewText
        
        if data.genreItems.isEmpty {
            collectionTopConstraint.constant = 0
            collectionHeightConstraint.constant = 0
        } else {
            items = data.genreItems
            collection.registerCell(type: LabelCollectionCell.self)
            collection.reloadData()
        }
    }
}

extension HorizontalViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LabelCollectionCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(text: items[indexPath.item].uppercased())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: collectionView.frame.height)
    }
}
