//
//  NetworkManger.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import Foundation
import Combine

class NetworkManager: NetworkType {
    //public var requestTimeOut: Float = 50
    
    func get<T: Decodable>(type: T.Type, url: URL?, headers: Headers
                          // ,timeout: Float?
                           ) -> AnyPublisher<T, Error>  {
        
        guard let url = url else {
            return AnyPublisher (
                Fail<T, Error>(error: NetworkError.invalidRequest)
            )
        }
        
        var urlRequest = URLRequest(url: url)
        headers.forEach { (key, value) in
                    if let value = value as? String {
                        urlRequest.setValue(value, forHTTPHeaderField: key)
                    }
                }
        
        
      return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in NetworkError.invalidRequest }
            .tryMap({ try NetworkManager.handleURLResponse(output: $0 )})
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in NetworkError.jsonDecodingError(error: error)}
        // process on background/private queue
            .subscribe(on: DispatchQueue.global(qos: .background))
        // send result on main queue
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
        
    
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        return output.data
    }

}
