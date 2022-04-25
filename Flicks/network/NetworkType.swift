//
//  NetworkType.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import Foundation
import Combine


protocol NetworkType {
    
   // var requestTimeOut: Float { get }
    
    typealias Headers = [String: Any]
        
        func get<T>(type: T.Type,
                    endpoint: Endpoint,
                    headers: Headers
                    //,timeout: Float?
        ) -> AnyPublisher<T, Error> where T: Decodable
    
}
