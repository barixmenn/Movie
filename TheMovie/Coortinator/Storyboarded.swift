//
//  Storyboarded.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//

import Foundation
import UIKit

enum StoryboardName: String {
    case main = "Main"
}

protocol Storyboarded {
    static func instantiate(name: StoryboardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(name: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name.rawValue, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
 
