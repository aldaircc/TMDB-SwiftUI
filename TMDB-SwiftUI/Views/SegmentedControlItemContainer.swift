//
//  SegmentedControlItemContainer.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 8/07/22.
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
