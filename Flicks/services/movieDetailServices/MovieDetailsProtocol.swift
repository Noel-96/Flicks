//
//  MovieDetailsProtocol.swift
//  Flicks
//
//  Created by Noel Obaseki on 07/06/2022.
//

import Foundation
import Combine
struct MovieDetailsStoreResult {
    
        let dataType: DataType
        let movieDetails: MovieDetails?
        let error: Error?
}

protocol MovieDetailsProtocol {
        var movieDetailsSubject: PassthroughSubject<MovieDetailsStoreResult, Error> { get }

        func getMovieDetails(id: String)
}
