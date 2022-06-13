//
//  ContentView.swift
//  Flicks
//
//  Created by Noel Obaseki on 21/04/2022.
//

import SwiftUI
import CoreData

struct MovieListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Movie.id, ascending: true)],
        animation: .default)
    private var movies: FetchedResults<Movie>

    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                FilterTabView(selectedTab: $viewModel.category)
                
                
                if viewModel.showNoData {
                    Text("Unable to load Movies list")
                } else if viewModel.isLoading {
                    ProgressView()
                        .frame(width: 50, height: 50)
                } else {
                    if viewModel.isOffline {
                        OfflineBarView()
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(movies) { movie in
                                NavigationLink(destination: MovieDetailsViewDestination(movieId: movie.id!, viewModel: viewModel)) {
                                    MovieView(movie: movie, height: 200)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .shadow(radius: 3)
                                        .onAppear(){viewModel.getMoreMovies(currentItem: movie)}
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }.padding()
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
        .background(Color(UIColor.systemGray6))
    }
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}
