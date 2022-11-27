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
                    CastItemView(cast: cast)
                }
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
    
    var body: some View {
        HStack(alignment: .center) {
            Image("tom_cruise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100, alignment: .center)
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
