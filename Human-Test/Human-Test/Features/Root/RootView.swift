//
//  RootView.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

import Timer

struct RootView: View {
    let store: StoreOf<RootFeature>
    
    var body: some View {
        VStack(spacing: 16) {
            TimerView(store: store.scope(
                state: \.timer, action: \.timer
            ))
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RootView(
        store: Store(initialState: RootFeature.State()) {
            RootFeature()
        }
    )
}
