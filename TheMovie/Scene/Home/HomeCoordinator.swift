//
//  HomeCoordinator.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
