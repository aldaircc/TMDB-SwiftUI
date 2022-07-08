//
//  StoryViewerView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/07/22.
//

import SwiftUI

final class StoryOV: ObservableObject {
    
    let timerPublisher = Timer.publish(every: 1, on: .main, in: .default)
    init() {
        timerPublisher.connect()
    }
}

struct StoryViewerView: View {
    let stories: [Double]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 6) {
                ForEach(stories, id: \.self) { story in
                    ProgressView(value: story)
                        .progressViewStyle(.linear)
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct StoryViewerView_Previews: PreviewProvider {
    static let stories = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.12, 0.13, 0.27]
    static var previews: some View {
        StoryViewerView(stories: stories)
    }
}
