//
//  VerticalMovieCell.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//


import UIKit
import SDWebImage

class VerticalMovieCell: UICollectionViewCell,ReuseProtocol,NibProtocol {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    func configure(data: MovieCellProtocol) {
        titleLabel.text = data.titleText
        ratingLabel.text = data.ratingText
        movieImage.loadURL(url: data.posterImage)
    }
}
