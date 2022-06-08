//
//  MovieView.swift
//  Flicks
//
//  Created by Noel Obaseki on 05/06/2022.
//

import SwiftUI

struct MovieView: View {
    @StateObject var imageHandlerViewModel = ImageProvider()
    
    let movie: Movie
    let height: CGFloat
    
    init(movie: Movie, height: CGFloat = .infinity) {
        self.movie = movie
        self.height = height
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Image(uiImage: imageHandlerViewModel.image).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fill)
                .frame(width:60,height:60)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                .onAppear {
                    imageHandlerViewModel.loadImage(url:URL(string: "\(Constants.Image.baseUrl)\(movie.posterPath!)" )! )
                }
            

            Text(movie.title ?? "Missing Title")
                .foregroundColor(Color.black)
                .padding(.horizontal, 8)
            Spacer()
        }

    }
}


//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView()
//    }
//}
