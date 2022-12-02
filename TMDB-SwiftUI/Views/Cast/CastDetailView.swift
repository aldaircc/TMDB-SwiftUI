//
//  CastDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 29/11/22.
//

import SwiftUI

struct CastDetailView: View {
    @ObservedObject var vm = MovieViewModel()
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Image(systemName: "play.fill")
                    
                    Section("Biography") {
                        Text(vm.personDetail?.biography ?? "")
                    }
                    
                    Section("Personal Info") {
                        Text("Know for")
                        Text("Content")
                        Text("Id: \(vm.personIdSelected)")
                    }
                }
//                .frame(width: 390)
                Spacer()
            }
        }
        .onAppear {
            vm.getDetailPerson()
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView()
    }
}
