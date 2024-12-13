//
//  SubmissionsView.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

public struct SubmissionsView: View {
    public let store: StoreOf<SubmissionsFeature>
    
    public init(store: StoreOf<SubmissionsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        ZStack {
            if store.isLocked {
                SubmissionsListView(store: store.scope(
                    state: \.list,
                    action: \.list
                ))
                .blur(radius: 10)
                
                LockIconView()
            } else {
                SubmissionsListView(store: store.scope(
                    state: \.list,
                    action: \.list
                ))
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SubmissionsView(
        store: Store(initialState: SubmissionsFeature.State()) {
            SubmissionsFeature()
        }
    )
}
