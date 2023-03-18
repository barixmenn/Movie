//
//  NetworkHelper.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//

import Foundation

enum ErrorTypes : String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid URL"
    case generalError = "General Error"
}

final class NetworkHelper {
    static let shared = NetworkHelper()
    private let BASE_URL = "https://api.themoviedb.org/3/"
    private let API_KEY = "ca45edd144675ad0b1560f0d52f4517c"
    
    func requestUrl(url: String) -> String {
        BASE_URL + url + "?api_key=\(API_KEY)"
    }
}
