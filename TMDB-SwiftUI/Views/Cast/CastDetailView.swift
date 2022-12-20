//
//  CastDetailView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 29/11/22.
//

import SwiftUI

struct CastDetailView: View {
    @ObservedObject var vm: MovieViewModel
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    ImageView(withURL: vm.personDetail?.path ?? .baseURL, pictureMode: .none)
                    Section {
                        PersonalFieldView(title: "Biography", value: vm.personDetail?.biography ?? "")
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Personal Info")
                            .fontWeight(.bold)
                        PersonalFieldView(title: "Know for", value: vm.personDetail?.known_for_department ?? "")
                        PersonalFieldView(title: "Gender", value: vm.personDetail?.genderType.description ?? "")
                        PersonalFieldView(title: "Birthday", value: vm.personDetail?.birthday ?? "")
                        PersonalFieldView(title: "Place of birth", value: vm.personDetail?.place_of_birth ?? "")
                        PersonalFieldView(title: "Also Known As", value: vm.personDetail?.also_known_as?.first ?? "-")
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            vm.getDetailPerson()
        }
    }
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(vm: MovieViewModel())
    }
}

struct PersonalFieldView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .fontWeight(.semibold)
            Text(value)
        }
    }
}
