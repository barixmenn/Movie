//
//  HomeViewModel.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

final class HomeViewModel {
    let manager = HomeManager.shared
    
    var movie: Movie?
    var genreItems = [GenreElement]()
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
}

extension HomeViewModel {
    func getCategoryItems() {
        manager.getCategoryMovies { [weak self] movie, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.movie = movie
                self?.successCallback?()
            }
        }
    }
    
    func getGenreItems() {
        manager.getGenres { [weak self] genre, error  in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.genreItems = genre ?? []
                GenreHandler.shared.setItems(items: genre ?? [])
                self?.getCategoryItems()
            }
        }
    }
}
