//
//  CollectionViewCell.swift
//  TheMovie
//
//  Created by Baris on 23.03.2023.
//

import UIKit

protocol PeopleCellProtocol {
    var titleText: String { get }
    var imagePath: String { get }
}

class PeopleCell: UICollectionViewCell, NibProtocol, ReuseProtocol {
    @IBOutlet private weak var peopleImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(data: PeopleCellProtocol) {
        titleLabel.text = data.titleText
        peopleImage.loadURL(url: data.imagePath)
    }
}
