//
//  SplashView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 11/10/22.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    @State var opacity = 0.3
    
    var body: some View {
        if isActive {
            MovieDetailView(vm: MovieViewModel(), movie: .testValue)
        } else {
            ZStack {
                Image("tmdbLogo")
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.opacity = 1
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
