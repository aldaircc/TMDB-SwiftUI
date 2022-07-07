//
//  CustomSegmentedControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 4/07/22.
//

import SwiftUI

private struct SegmentedControlNamespaceKey: EnvironmentKey {
    static var defaultValue: Namespace.ID?
}

private extension EnvironmentValues {
    var segmentedControlNamespace: Namespace.ID? {
        get { self[SegmentedControlNamespaceKey.self] }
        set { self[SegmentedControlNamespaceKey.self] = newValue }
    }
}

private struct SelectedSegmentTagKey: EnvironmentKey {
    static var defaultValue: Any?
}

private extension EnvironmentValues {
    var selectedSegmentTag: Any? {
        get { self[SelectedSegmentTagKey.self] }
        set { self[SelectedSegmentTagKey.self] = newValue }
    }
}

public extension View {
    func segmentedControlItemTag<SelectionValue: Hashable>(_ tag: SelectionValue) -> some View {
        return SegmentedControlItemContainer(tag: tag, content: self)
    }
}

private struct SegmentedControlItemContainer<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Environment(\.segmentedControlNamespace) var segmentedNamespace
    @Namespace var namespace
    @Environment(\.selectedSegmentTag) var selectedSegmentTag
    let tag: SelectionValue
    let content: Content
    
    @ViewBuilder var body: some View {
        content
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .foregroundColor(isSelected ? Color("Segmented Text Selected") : .white.opacity(0.8))
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
        .background(RoundedRectangle(cornerRadius: 10).fill(.gray))
        .frame(idealHeight: 16)
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
