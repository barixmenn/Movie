
<h1>The Movie</h1> 

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
 
    // request
    func request<T: Codable>(type: T.Type,
                             url: String,
                             method: HTTPMethod,
                             completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "", method: method).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            case .failure(let _):
                completion(.failure(.generalError))
            }
        }
    }
    
    //response
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}

}
````
