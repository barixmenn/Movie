//
//  TitleCell.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//

import UIKit

class TitleCell: UICollectionViewCell, ReuseProtocol, NibProtocol {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
