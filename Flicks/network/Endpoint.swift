//
//  Endpoint.swift
//  Flicks
//
//  Created by Noel Obaseki on 23/04/2022.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var headers: [String: String]? { get }
}
