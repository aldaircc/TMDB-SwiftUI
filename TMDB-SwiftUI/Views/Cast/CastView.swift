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
                ForEach(vm.casts.cast) { cast in
                    CastItemView(cast: cast, vm: vm)
                }
            }
            NavigationLink("", isActive: $vm.isNavigateToCastDetail) {
                CastDetailView(vm: vm)
            }
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
            VStack(alignment: .leading) {
                Text("\(cast.originalName ?? "")")
                    .fontWeight(.semibold)
                Text("\(cast.character ?? "")")
            }
            Spacer()
        }
        .padding(5)
        .onTapGesture {
            print("Tapped: \(cast.name ?? "")")
            vm.goToCastDetail(cast.id)
        }
    }
}
