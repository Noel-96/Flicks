//
//  NetworkError.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import Foundation

enum NetworkError: Error {
    
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
