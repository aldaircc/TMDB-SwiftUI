//
//  ImageView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 27/11/22.
//

import SwiftUI

enum PictureMode {
    case photo
    case landScape
    case none
}

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image = UIImage()
    let defaultImage = UIImage(named: "none-image")!
    let pictureMode: PictureMode
    
    init(withURL url: URL, pictureMode: PictureMode = .photo) {
        imageLoader = ImageLoader(urlString: url)
        self.pictureMode = pictureMode
    }
    
    var pictureView: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? defaultImage
            }
    }
    
    var body: some View {
        switch pictureMode {
        case .photo:
            pictureView
                .frame(height: (image != defaultImage) ? 100 : 65, alignment: .center)
        case .landScape, .none:
            pictureView
        }
    }
}
