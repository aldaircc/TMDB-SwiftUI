//
//  StoryViewerView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/07/22.
//

import SwiftUI

struct StoryViewerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProgressView(value: 0.9)
                    .progressViewStyle(.linear)
            }
            .padding(.horizontal)
            
        }
    }
}

struct StoryViewerView_Previews: PreviewProvider {
    static var previews: some View {
        StoryViewerView()
    }
}
