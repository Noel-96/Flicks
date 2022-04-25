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
    
    func fetchMoviesList(category: Endpoints.Movies.Category)
}
