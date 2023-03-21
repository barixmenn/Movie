//
//  HorizontalViewCell.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import UIKit
import SDWebImage

protocol MovieCellProtocol {
    var posterImage: String {get}
    var titleText: String {get}
    var ratingText: String {get}
    
}

class HorizontalViewCell: UICollectionViewCell,ReuseProtocol,NibProtocol {

    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: MovieCellProtocol) {
        titleLabel.text = data.titleText
        ratingLabel.text = data.ratingText
        movieImage.sd_setImage(with: URL(string: data.posterImage)!)
        
    }

}