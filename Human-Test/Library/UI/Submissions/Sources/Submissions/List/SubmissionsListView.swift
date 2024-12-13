//
//  SubmissionsListView.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

public struct SubmissionsListView: View {
    public let store: StoreOf<SubmissionsListFeature>
    
    public init(store: StoreOf<SubmissionsListFeature>) {
        self.store = store
    }
    
    public var body: some View {
}

#Preview(traits: .sizeThatFitsLayout) {
    SubmissionsListView(
        store: Store(initialState: SubmissionsListFeature.State()) {
            SubmissionsListFeature()
        }
    )
}
