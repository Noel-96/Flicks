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

struct Endpoints {
    private init() {}
    
    struct Movies: Endpoint {
        private var path: String { "movie" }
        
        
        enum Category: String {
            case upcoming
            case top_rated
            case popular
            case now_playing
        }
        
        let page: Int
        let category: Category
        
        init(page: Int = 1, category: Category) {
            self.page = page
            self.category = category
        }
        
        func createUrl() -> URLRequest {
            return URLRequest(httpMethod: .get, path: "\(path)/\(category.rawValue)", queries: ["page": page])
        }
    }
    
    
    
    
    struct MovieDetails: Endpoint {
        private var path: String { "movie" }
        
        let movieId: String
                
        func createUrl() -> URLRequest {
            return URLRequest(httpMethod: .get , path: "\(path)/\(movieId)")
        }
    }

}
