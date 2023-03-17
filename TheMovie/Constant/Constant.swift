//
//  Constant.swift
//  TheMovie
//
//  Created by Baris on 18.03.2023.
//discover/movie?

import Foundation

final class Constant {
    
    enum serviceEndPoint: String {
        
        case BASE_URL = "https://api.themoviedb.org/3/discover/movie?"
        case API_KEY = "api_key=ca45edd144675ad0b1560f0d52f4517c"
        
        static func fetchMovie() -> String {
            "\(serviceEndPoint.BASE_URL.rawValue)\(serviceEndPoint.API_KEY.rawValue)"
        }
    }
}
