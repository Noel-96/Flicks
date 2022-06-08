//
//  MovieDetailsViewDestination.swift
//  Flicks
//
//  Created by Noel Obaseki on 07/06/2022.
//

import SwiftUI

struct MovieDetailsViewDestination: View {
    let movieId: String
    let viewModel: MovieListViewModel
    
    var body: some View {
        MovieDetailsView(viewModel: MovieDetailsViewModel(movieId: movieId))
            .onDisappear(perform: {
                viewModel.loadMoviesIfNeeded()
            })
    }
}

//struct MovieDetailsViewDestination_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsViewDestination()
//    }
//}
