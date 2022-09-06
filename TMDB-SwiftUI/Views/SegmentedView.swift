//
//  SegmentedView.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 1/07/22.
//

import SwiftUI

struct SegmentedView: View {
    let options: [String]
    @State var selectionPosition: CGFloat = 0.0
    var body: some View {
//        GeometryReader { gproxy in
        ZStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 10) {
                Picker("", selection: .constant(0)) {
                    Text("xx")
                        .tag(0)
                }
                .pickerStyle(.segmented)
                ForEach(options, id: \.self) { option in
//                    GeometryReader { proxy in
                            Button {
                                // TO DO
                                /*let global = proxy.frame(in: .global)
                                print("MinX: \(global.minX)")
                                print("MidX: \(global.midX)")
                                print("MaxX: \(global.maxX)")
                                print(global.width)
                                selectionPosition = global.minX
                                */
                            } label: {
                                Text(option)
                            }
                                            .background(.yellow)
//                    }
//                    .frame(height: 20)
                    
                }
            }
            .padding()
            .background(Color.red)
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
            }
            
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.blue.opacity(0.8))
//                .frame(width: 50, height: 30)
//                .offset(x: selectionPosition, y: 0)
//                .animation(.easeIn, value: selectionPosition)
        }
            
//        }
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static let options = ["Streaming", "On TV", "For rent", "In Theaters"]
    static var previews: some View {
        SegmentedView(options: options)
    }
}
