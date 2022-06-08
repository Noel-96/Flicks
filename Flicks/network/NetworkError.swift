//
//  NetworkError.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import Foundation

enum NetworkError: Error {
    case networkFailureError(String)
    case apiErrorResponse([String: Any])
    case decodeError(String)
    case invalidRequest
    case dataLoadingError(statusCode: Int, data: Data)
}
