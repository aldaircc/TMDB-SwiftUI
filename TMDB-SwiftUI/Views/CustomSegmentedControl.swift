//
//  CustomSegmentedControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 4/07/22.
//

import SwiftUI

public struct CustomSegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Namespace var namespace
    @Binding public var selection: SelectionValue
    private let content: Content
    
    public init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            content
        }
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(1)
        .textCase(.none)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .frame(idealHeight: 16)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 1))
        .environment(\.selectedSegmentTag, $selection)
        .environment(\.segmentedControlNamespace, namespace)
    }
}

struct RootView: View {
    enum LayoutMode {
        case years
        case months
        case days
    }
    
    @State var mode: LayoutMode = .days
    
    var body: some View {
        VStack {
            CustomSegmentedControl(selection: $mode) {
                Text("Years").segmentedControlItemTag(LayoutMode.years)
                Text("Months").segmentedControlItemTag(LayoutMode.months)
                Text("Days").segmentedControlItemTag(LayoutMode.days)
            }
            .frame(width: 300)
        }
        .frame(width: 400, height: 400, alignment: .center)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
