//
//  CustomTopBar.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/10/22.
//

import SwiftUI

enum ImageCategory {
    case poster
    case backdrop
    case logo
}

typealias ImagesCategory = [ImageCategory: [ImageModel]]

struct CustomTopBar: View {
    private let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    let sectionName: String
    
    var images: ImagesCategory
    
    var urls: [URL] {
        var urlArray: [URL]
        
        guard let imagesFiltered = images[imageCategory],
              imagesFiltered.count != 0 else {
            return []
        }
        
        let startIndex = images[imageCategory]?.startIndex ?? 0
        let endIndex = imagesFiltered.count < 6 ? imagesFiltered.count : 6
        let elements = imagesFiltered[startIndex...endIndex]
        
        urlArray = elements.compactMap({
            URL(string: "\(baseImageUrl)\($0.filePath)")
        })
        return urlArray
    }
    
    @State var imageCategory = ImageCategory.poster
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionName)
                    .padding(.trailing, 20)
                
                Button(action: { imageCategory = .poster }) {
                    Text("Posters")
                }
                
                Button(action: { imageCategory = .backdrop }) {
                    Text("Backdrops")
                        .underline(true, color: .green)
                        .fontWeight(.bold)
                }
                
                Button(action: { imageCategory = .logo }) {
                    Text("Logos")
                }
            }
            .background(.orange)
            
            /// Container View
            ScrollView(.horizontal) {
                HStack {
                    ForEach(urls, id: \.self) { url in
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        .onTapGesture {
                            print("It was Tapped \(url.absoluteString)")
                        }
                    }
                }
            }
            
        }
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar(sectionName: "Media",
                     images: [
                        .backdrop: [ImageModel(aspectRatio: 1, height: 1,
                                               iso6391: nil, filePath: "/7hkN0cqtzXnQGoNPtZUYDSKR4IZ.jpg",
                                               voteAverage: 5.0, voteCount: 1, width: 100)],
                        .logo: [ImageModel(aspectRatio: 1, height: 1,
                                           iso6391: nil, filePath: "/zYlv7i7H4t9xQ1ZNEcRWO908mFT.png",
                                           voteAverage: 5.0, voteCount: 1, width: 100)],
                        .poster: [ImageModel(aspectRatio: 1, height: 1,
                                             iso6391: nil, filePath: "/v3yyMBZk52HxTCrDLh46NpoSkCb.jpg",
                                             voteAverage: 5.0, voteCount: 1, width: 100)]
                     ])
    }
}
