//
//  TimerView.swift
//  Timer
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

public struct TimerView: View {
    public let store: StoreOf<TimerFeature>
    
    public init(store: StoreOf<TimerFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            title
            
            subtitle
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(Color(.background))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .task { await store.send(.onTask) }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TimerView(
        store: Store(initialState: TimerFeature.State(
            duration: .seconds(6 * 60 * 60)
        )) {
            TimerFeature()
        }
    )
}
