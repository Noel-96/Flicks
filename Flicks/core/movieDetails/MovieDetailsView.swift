//
//  MovieDetailsView.swift
//  Flicks
//
//  Created by Noel Obaseki on 06/06/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    @StateObject var viewModel: MovieDetailsViewModel
    @StateObject var imageHandlerViewModel = ImageProvider()

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.showNoData {
                Text("Unable to load Movie details")
            } else if viewModel.isLoading {
                ProgressView()
                    .frame(width: 50, height: 50)
            } else if let movieDetails = viewModel.movieDetails {
                if viewModel.isOffline {
                    OfflineBarView()
                }
                
                ScrollView {
                    
                    Image(uiImage: imageHandlerViewModel.image).resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode:.fill)
                        .frame(width:60,height:300)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1))
                        .onAppear {
                            imageHandlerViewModel.loadImage(url:URL(string: "\(Constants.Image.baseUrl)\(movieDetails.posterPath!)" )! )
                        }
                    

                    VStack(alignment: .leading, spacing: 10) {
                        Text(movieDetails.title ?? "Missing Title")
                        Text("Overview:").bold()
                        Text(movieDetails.overview ?? "No Overview")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.horizontal, 8)
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Movie Details", displayMode: .inline)

    }
}

//struct MovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView()
//    }
//}
