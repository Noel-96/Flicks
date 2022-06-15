//
//  MockNetworkManager.swift
//  FlicksTests
//
//  Created by Noel Obaseki on 15/06/2022.
//

import Foundation
import Combine
@testable import Flicks

class MockNetworkManager: NetworkType {
    

    var failureError: Error? = nil
    var successObject: AnyObject? = nil
    
    func get<T>(type: T.Type, endpoint: Endpoint, headers: Headers, decoder: JSONDecoder) -> AnyPublisher<T, Error> where T : Decodable {
        guard self.failureError == nil else {
            return Result.failure(self.failureError!).publisher.eraseToAnyPublisher()
        }
        
        return Result.success((self.successObject as? T)!).publisher.eraseToAnyPublisher()
    }
}
