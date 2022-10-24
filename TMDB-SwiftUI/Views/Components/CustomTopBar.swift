//
//  CustomTopBar.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 22/10/22.
//

import SwiftUI

struct CustomTopBar: View {
    let sectionName: String
    
    var urls: [URL]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(sectionName)
                    .padding(.trailing, 20)
                
                Button(action: { } ) {
                    Text("Posters")
                }
                
                Button(action: { } ) {
                    Text("Backdrops")
                        .underline(true, color: .green)
                        .fontWeight(.bold)
                }
                
                Button(action: { } ) {
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
                    }
                }
            }
            
        }
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar(sectionName: "Media",
                     urls: [
                        URL(string: "https://image.tmdb.org/t/p/w500/pfAZP7JvTTxqgq7n6A1OYgkAdEW.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/aJAZa8nNDeSFh8SxSaLzgah2u8Q.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/8kH76SeYSU32IvliZEKQ0LQeDyz.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/664alVIZgvBKqGX1rNxwykj6keJ.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/49fVsbxXTf7wpYGjMI2nTnJADb6.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/7hkN0cqtzXnQGoNPtZUYDSKR4IZ.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/rhIMDeJcYIlC0vgWFceh2B4sYuy.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/b42UaXsufDYQVjwNPaZbXVfJ38B.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/l1ORpdYr8uFZ9MNYKoq1p6fIc4M.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/e9PsdPFOAqVHqoF38ieA2QPgqR8.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/pjT1wmlDItIEX2ZHSdqg8sL6IcV.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/3yuoJwC0GGYM7Cfok9IjtkjPWrK.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/1lz4IxwC1BeO0KrjIBhXo16L8Lb.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/6x9IMtjSKlszrsowYfwvIK3xQGp.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/5KLYFQxDJN5CZYajqPF0ceBtQtc.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/xEv4jxr4IkGY9eVcQYZCNHX7O6U.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/8eLneskfRctwyy6ztDoWio5bUHE.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/aDP925IF31AZCWgTfya0EUuyXEK.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/dty8keAVIFokUzdOrlUydjPFl9V.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/hlaCx36plA50t2ULGo4WCgcTHRM.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/wqh54zv29b3x6x3ua53u4orS5lt.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/wNTD4IQWRlGLf1c6bfP0rU1i5M3.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/7MySMAZQIUjbcws9SQJxMrEpc4v.jpg")!,
                        URL(string: "https://image.tmdb.org/t/p/w500/gBHcNqmF9H1buVbysEUge9B0tI1.jpg")!,
                           ])
    }
}
