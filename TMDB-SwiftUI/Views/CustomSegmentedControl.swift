//
//  CustomSegmentedControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 4/07/22.
//

import SwiftUI

public struct CustomSegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Binding public var selection: SelectionValue
    private let content: Content
    
    public init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        content
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
