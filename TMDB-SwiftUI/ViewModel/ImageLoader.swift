//
//  ImageLoader.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 27/11/22.
//

import Foundation
import Combine

final class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString: URL) {
        let task = URLSession.shared.dataTask(with: urlString) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
