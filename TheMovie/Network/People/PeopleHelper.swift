//
//  PeopleHelper.swift
//  TheMovie
//
//  Created by Baris on 22.03.2023.
//

import Foundation

enum PeopleEndpoint: String {
    case popular = "person/popular"
    
    var path : String {
        switch self  {
        case .popular:
            return NetworkHelper.shared.requestUrl(url: PeopleEndpoint.popular.rawValue)
        }
    }
}


