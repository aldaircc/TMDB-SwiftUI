//
//  ImageView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 27/11/22.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image = UIImage()
    
    init(withURL url: URL) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100, alignment: .center)
            .cornerRadius(10)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
