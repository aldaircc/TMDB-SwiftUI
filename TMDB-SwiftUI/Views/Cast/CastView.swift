//
//  CastView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 23/11/22.
//

import SwiftUI

struct CastView: View {
    @ObservedObject var vm = MovieViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.castFiltered) { cast in
                    CastItemView(cast: cast, vm: vm)
                        .onTapGesture {
                            vm.goToCastDetail(cast.id)
                        }
                }
            }
            .searchable(text: $vm.castFilter,
                        prompt: Text("Type name..."))
        }
    }
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView()
    }
}

struct CastItemView: View {
    let cast: CastModel
    @ObservedObject var vm = MovieViewModel()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        HStack(alignment: .center) {
            ImageView(withURL: cast.imagePath)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("\(cast.originalName ?? "")")
                    .fontWeight(.semibold)
                Text("\(cast.character ?? "")")
            }
            Spacer()
        }
        .padding(5)
    }
}
