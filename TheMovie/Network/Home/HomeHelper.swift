//
//  HomeHelper.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

enum HomeEndpoint : String {
    case popular =  "popular"
    
    var path : String {
        switch self {
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.popular.rawValue)
        }
    }
}
