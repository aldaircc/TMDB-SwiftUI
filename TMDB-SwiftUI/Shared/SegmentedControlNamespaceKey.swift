//
//  SegmentedControlNamespaceKey.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 8/07/22.
//

import SwiftUI

public struct SegmentedControlNamespaceKey: EnvironmentKey {
    public static var defaultValue: Namespace.ID?
}

extension EnvironmentValues {
    var segmentedControlNamespace: Namespace.ID? {
        get { self[SegmentedControlNamespaceKey.self] }
        set { self[SegmentedControlNamespaceKey.self] = newValue }
    }
}
