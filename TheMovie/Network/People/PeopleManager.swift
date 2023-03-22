//
//  PeopleManager.swift
//  TheMovie
//
//  Created by Baris on 22.03.2023.
//

import Foundation

protocol PeopleManagerProtocol {
    func getPopularPeople(page: Int, complete: @escaping((People?, Error?)->()))
}

final class PeopleManager : PeopleManagerProtocol{
    static let shared = PeopleManager()
}

extension PeopleManager {
    func getPopularPeople(page: Int, complete: @escaping ((People?, Error?) -> ())) {
        NetworkManager.shared.request(type: People.self,
                                      url: PeopleEndpoint.popular.path + "&page=\(page)",
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
