//
//  HomeManager.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getCategoryMovies(complete: @escaping((Movie?,Error?) -> ()))
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
}
