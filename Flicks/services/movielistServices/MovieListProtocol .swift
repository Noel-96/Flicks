//
//  movieListProtocol .swift
//  Flicks
//
//  Created by Noel Obaseki on 25/04/2022.
//

import Foundation
import Combine


struct MoviesStoreResult {
    let dataType: DataType
    let error: Error?
}

protocol MovieListProtocol {
    var moviesResponseSubject: PassthroughSubject<MoviesStoreResult, Error> { get }
    
    func fetchMoviesList(page: Int , category: Endpoints.Movies.Category)
    
    func fetchMoreMoviesList(page: Int , category: Endpoints.Movies.Category)
    
    func getMoviesList ()
}
