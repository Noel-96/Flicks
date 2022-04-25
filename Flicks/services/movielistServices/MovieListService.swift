//
//  movieListService.swift
//  Flicks
//
//  Created by Noel Obaseki on 25/04/2022.
//

import Foundation
import Combine

final class MovieListService: MovieListProtocol {
    var moviesResponseSubject: PassthroughSubject<MoviesStoreResult, Error>
    
    func fetchMoviesList(category: Endpoints.Movies.Category) {
        <#code#>
    }
    
    init(){
        
    }
}
