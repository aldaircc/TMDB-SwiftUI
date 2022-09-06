//
//  SelectedSegmentTagKey.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 8/07/22.
//

import SwiftUI

public struct SelectedSegmentTagKey: EnvironmentKey {
    public static var defaultValue: Any?
}

extension EnvironmentValues {
    var selectedSegmentTag: Any? {
        get { self[SelectedSegmentTagKey.self] }
        set { self[SelectedSegmentTagKey.self] = newValue }
    }
}
