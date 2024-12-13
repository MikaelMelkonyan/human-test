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
        VStack(spacing: 0) {
            title
            
            scrollView
        }
        .task { await store.send(.onTask) }
    }
}

// MARK: - Private
private extension SubmissionsListView {
    var title: some View {
        HStack(spacing: 0) {
            Text("Submissions", bundle: .module)
                .font(.title.weight(.medium))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
    
    var scrollView: some View {
        ScrollView {
            if store.isLoading {
                listStack
                    .redacted(reason: .placeholder)
            } else {
                listStack
                
                message
            }
        }
        .refreshable {
            await store.send(.refresh)
        }
        .scrollDisabled(store.isLoading)
    }
    
    var listStack: some View {
        LazyVStack(spacing: 20) {
            ForEach(Array(store.scope(
                state: \.items,
                action: \.items
            )), id: \.state.id) { store in
                SubmissionView(store: store)
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    var message: some View {
        if let message = store.message {
            Text(message, bundle: .module)
                .foregroundColor(Color(.message))
                .padding(.horizontal, 20)
                .padding(.vertical, 40)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SubmissionsListView(
        store: Store(initialState: SubmissionsListFeature.State(
            isLoading: true
        )) {
            SubmissionsListFeature()
        }
    )
}
