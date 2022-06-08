//
//  ImageProvider.swift
//  Flicks
//
//  Created by Noel Obaseki on 05/06/2022.
//

import Foundation
import SwiftUI
import Combine

class ImageProvider: ObservableObject {
    @Published var image = UIImage(named: "Loading_Default_Picture")!
    private var cancellable: AnyCancellable?
    private let imageLoader = ImageLoader()

    func loadImage(url: URL) {
        self.cancellable = imageLoader.publisher(for: url)
            .sink(receiveCompletion: { failure in
            print(failure)
        }, receiveValue: { image in
            self.image = image
        })
    }
}

