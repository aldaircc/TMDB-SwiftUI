//
//  CustomSegmentedControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 4/07/22.
//

import SwiftUI

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
        //return
        Text("xxx")
    }
}

public struct CustomSegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
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
        .textCase(.uppercase)
        .background(RoundedRectangle(cornerRadius: 5).fill(.gray))
        .frame(idealHeight: 16)
        .environment(\.selectedSegmentTag, $selection)
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
                Text("Years")
                Text("Months")
                Text("Days")
            }
            .frame(width: 300)
        }
        .frame(width: 400, height: 400, alignment: .center)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .previewLayout(.fixed(width: 100, height: 100))
    }
}


//struct CustomSegmentedControl_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSegmentedControl(selection: <#T##Binding<_>#>, content: <#T##() -> _#>)
//    }
//}
