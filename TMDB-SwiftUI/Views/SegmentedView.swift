//
//  SegmentedView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 1/07/22.
//

import SwiftUI

struct SegmentedView: View {
    let options: [String]
    var body: some View {
        HStack {
            ForEach(options, id: \.self) { option in
                Button {
                    // TO DO
                } label: {
                    Text(option)
                }

            }
        }
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static let options = ["Streaming", "On TV", "For rent", "In Theaters"]
    static var previews: some View {
        SegmentedView(options: options)
    }
}
