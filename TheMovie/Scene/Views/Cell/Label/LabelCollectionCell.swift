//
//  LabelCollectionCell.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//

import UIKit

class LabelCollectionCell: UICollectionViewCell, ReuseProtocol, NibProtocol {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
