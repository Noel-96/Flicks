//
//  Endpoint.swift
//  Flicks
//
//  Created by Noel Obaseki on 23/04/2022.
//

import Foundation

protocol Endpoint {
    func createUrl() -> URLRequest
}
