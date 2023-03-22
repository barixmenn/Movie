//
//  HomeViewModel.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

final class HomeViewModel {
    var coordinator: HomeCoordinator?
    
    let manager = HomeManager.shared
    
    var movie: Movie?
    var movieItems = [MovieResult]()
    var genreItems = [GenreElement]()
    var nowPlayingItems = [MovieResult]()
    
    var movieCategory: MovieCategory = .nowPlaying
    
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
    
    
    func getNowPlaying() {
        manager.getCategoryMovies(type: .nowPlaying, page: 1) { [weak self] movie, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                if let movie = movie {
                    self?.nowPlayingItems = movie.results ?? []
                    self?.successCallback?()
                }
            }
        }
    }
}
