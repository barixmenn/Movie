//
//  UIImageView+Extension.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//


import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadURL(url: String) {
        if let url = URL(string: url) {
            sd_setImage(with: url)
        }
    }
}
