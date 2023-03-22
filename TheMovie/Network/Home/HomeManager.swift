//
//  HomeManager.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getCategoryMovies(complete: @escaping((Movie?,Error?) -> ()))
    func getGenres(complete: @escaping(([GenreElement]?,Error?) -> ()))
}

final class HomeManager : HomeManagerProtocol {
    static let shared = HomeManager()
}

extension HomeManager {
    func getCategoryMovies(complete: @escaping ((Movie?, Error?) -> ())) {
        NetworkManager.shared.request(type: Movie.self, url: HomeEndpoint.popular.path, method: .get) { response in
            
            switch response {
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }
    
    //genre
    func getGenres(complete: @escaping (([GenreElement]?, Error?) -> ())) {
           NetworkManager.shared.request(type: Genre.self,
                                         url: HomeEndpoint.genre.path,
                                         method: .get) { response in
               switch response {
               case .success(let data):
                   complete(data.genres, nil)
               case .failure(let error):
                   complete(nil, error)
               }
           }
       }
    
    
    func getCategoryMovies(type: MovieCategory, page: Int, complete: @escaping ((Movie?, Error?) -> ())) {
        var url = ""
        switch type {
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        case .popular:
            url = HomeEndpoint.popular.path
        }
        NetworkManager.shared.request(type: Movie.self,
                                      url: url + "&page=\(page)",
                                      method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
}
