//
//  CustomSegmentedControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 4/07/22.
//

import SwiftUI

public struct SegmentedControlItemContainer<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Environment(\.segmentedControlNamespace) var segmentedNamespace
    @Namespace var namespace
    @Environment(\.selectedSegmentTag) var selectedSegmentTag
    let tag: SelectionValue
    let content: Content
    
    @ViewBuilder public var body: some View {
        content
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .foregroundColor(Color(isSelected ? "Segmented Text Selected" : "Segmented Text Color"))
            .background(isSelected ? background : nil)
            .onTapGesture {
                select()
            }
            .disabled(isSelected)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color("Segmented Selected Background"))
            .padding(.horizontal, -4)
            .cornerRadius(10)
            .matchedGeometryEffect(id: "selection", in: segmentedNamespace ?? namespace)
    }
    private var isSelected: Bool {
        let selectedTag = (selectedSegmentTag as? Binding<SelectionValue>)?.wrappedValue
        return tag == selectedTag
    }
    private func select() {
        withAnimation(.easeInOut(duration: 0.2)) {
            if let binding = selectedSegmentTag as? Binding<SelectionValue> {
                binding.wrappedValue = tag
            }
        }
    }
}

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
