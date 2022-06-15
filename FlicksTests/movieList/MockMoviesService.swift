//
//  MockMoviesService.swift
//  FlicksTests
//
//  Created by Noel Obaseki on 15/06/2022.
//

import Foundation
import Combine
@testable import Flicks

class MockMoviesService: MovieListProtocol {
   
    
    let moviesResponseSubject = PassthroughSubject<MoviesStoreResult, Error>()
        
    var cachedMoviesCount = 0
    var moviesStoreResult: MoviesStoreResult = MoviesStoreResult(dataType: .noData, movieList: [], error: nil)
        
    
    func fetchMoviesList(page: Int, category: Endpoints.Movies.Category) {
        moviesResponseSubject.send(moviesStoreResult)
    }
    
    func fetchMoreMoviesList(page: Int, category: Endpoints.Movies.Category, movieList: [Movie]) {
        moviesResponseSubject.send(moviesStoreResult)
    }
    func getPersistedMoviesCount() -> Int {
        return self.cachedMoviesCount
    }
    

}
