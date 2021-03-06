//
//  ContentView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 2/07/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello")
            Picker("Mode", selection: .constant(1)) {
                Text("Manual").tag(1)
                Text("Auto").tag(2)
            }
            .labelsHidden()
            .pickerStyle(.segmented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
