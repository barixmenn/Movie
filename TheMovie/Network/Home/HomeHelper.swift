//
//  HomeHelper.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

enum MovieCategory {
    case nowPlaying
    case popular

}

enum HomeEndpoint: String {
    case genre = "genre/movie/list"
    case popular = "movie/popular"
    case nowPlaying = "movie/now_playing"
    
    
    var path: String {
        switch self {
        case .genre:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.genre.rawValue)
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.popular.rawValue)
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.nowPlaying.rawValue)
            
        }
    }
}
