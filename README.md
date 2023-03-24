
<h1>Movie</h1> 

## Technologies
+ MVVM Architecture ✅ 
+ Programmatically ✅
+ Alamofire ✅


## Demo

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNjI1MjA1NGM3NWFkODg4MDJmMDA0ODA1NzdiNDhmZDNhMWI2Y2Q1YSZjdD1n/fLCkn1zclOcbFhxeMq/giphy.gif) 


## API

Ex: https://www.themoviedb.org

```` swift
{
final class NetworkManager {
    static let shared = NetworkManager()
}

extension NetworkManager {
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping ((Result<T, AFError>) -> ())) {
        AF.request(url, method: method).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
}
````
