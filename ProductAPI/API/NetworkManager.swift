import Foundation
class NetworkManager {
    static let shared = NetworkManager()  // Singleton instance for sharing to ViewModel
    
    // Fetch Data Generic Function for any Model + UrlString
    func fetchData<T: Decodable>(from urlString: String, modelType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        //Check Url Valid or Not
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            //Check Error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            //Check Data is Nil or Not
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // Decode Json
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.decodingError(error)))
            }
            
        }.resume()
    }
}
