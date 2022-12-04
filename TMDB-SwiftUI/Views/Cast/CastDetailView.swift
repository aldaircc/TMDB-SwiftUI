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
                        VStack {
                            Text("Know for")
                            Text(vm.personDetail?.known_for_department ?? "")
                        }
                        
                        VStack {
                            Text("Gender")
                            Text("\(vm.personDetail?.gender ?? 0)")
                        }
                        Text("Birthday")
                        Text(vm.personDetail?.birthday ?? "")
                        Text("Place of birth")
                        Text(vm.personDetail?.place_of_birth ?? "")
                        Text("Also Known As")
                        Text("\(vm.personDetail?.also_known_as?.first ?? "")")
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
