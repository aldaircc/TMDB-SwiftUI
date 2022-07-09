//
//  StoryViewerView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 7/07/22.
//

import SwiftUI
import Combine

final class StoryOV: ObservableObject {
    
    let timerPublisher = Timer.publish(every: 1, on: .main, in: .default)
    var subscribers = Set<AnyCancellable>()
    let progressBySecond: Double  = 60/4
    @Published var progress: Double = 0
    init() {
        timerPublisher
            .autoconnect()
            .sink { _ in
                
                if (self.progress + (self.progressBySecond / 100)) >= 1 {
                    self.progress = 1
                    self.subscribers.first?.cancel()
                } else {
                    self.progress += self.progressBySecond
                }
                
            }
            .store(in: &subscribers)
    }
}

struct StoryViewerView: View {
    let stories: [Double]
    @ObservedObject var storyOV = StoryOV()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 6) {
                ForEach(stories, id: \.self) { story in
                    
                    if story == 0 {
                        ProgressView(value: storyOV.progress)
                            .progressViewStyle(.linear)
                            .animation(.linear(duration: 0.1), value: storyOV.progress)
                    } else {
                        ProgressView(value: story)
                            .progressViewStyle(.linear)
                    }
                    
                }
            }
            .padding(.horizontal)
            
        }
        .onReceive(storyOV.$progress) { newValue in
            print(newValue)
        }
    }
}

struct StoryViewerView_Previews: PreviewProvider {
    static let stories = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.12, 0.13, 0.27]
    static var previews: some View {
        StoryViewerView(stories: stories)
    }
}
