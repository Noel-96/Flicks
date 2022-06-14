import Foundation
import Combine

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

class NetworkManager: NetworkType {
    //public var requestTimeOut: Float = 50
    static let sharedInstance = NetworkManager()
    
    func get<T: Decodable>(type: T.Type, endpoint: Endpoint, headers: Headers, decoder: JSONDecoder
                          // ,timeout: Float?,
                           ) -> AnyPublisher<T, Error>  {
        
        var urlRequest = endpoint.createUrl()
        //URLRequest(url: url)
        headers.forEach { (key, value) in
                    if let value = value as? String {
                        urlRequest.setValue(value, forHTTPHeaderField: key)
                    }
                }
        
        
      return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in NetworkError.invalidRequest }
            .tryMap({ (apiResponse) -> T in
//                guard let httpResponse = apiResponse.response as? HTTPURLResponse, httpResponse.statusCode != 204 else { print("httpResponseerror")}
                
                do {
                    return try decoder.decode(T.self, from: apiResponse.data)
                }
//                catch (let error) {
//                    if let dictionary = try JSONSerialization.jsonObject(with: apiResponse.data, options: .mutableContainers) as? [String: Any] {
//                        print("dict error")
//                    }
//                    print("local error")
//                }
            })  .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
 
           // .tryMap({ try NetworkManager.handleURLResponse(output: $0 )})
           // .decode(type: T.self, decoder: JSONDecoder())
           // .mapError { error in NetworkError.decodeError("decoding error")}
        // process on background/private queue
          
        // send result on main queue
          
    }
        
    
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        return output.data
    }

}
