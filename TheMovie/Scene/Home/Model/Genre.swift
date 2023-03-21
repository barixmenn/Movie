//
//  Genre.swift
//  TheMovie
//
//  Created by Baris on 21.03.2023.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let genres: [GenreElement]?
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int?
    let name: String?
}
