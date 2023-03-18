//
//  HorizontalViewCell.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import UIKit



class HorizontalViewCell: UICollectionViewCell {

    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
