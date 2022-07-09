//
//  View+Extensions.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 8/07/22.
//

import SwiftUI

public extension View {
    func segmentedControlItemTag<SelectionValue: Hashable>(_ tag: SelectionValue) -> some View {
        return SegmentedControlItemContainer(tag: tag, content: self)
    }
}
