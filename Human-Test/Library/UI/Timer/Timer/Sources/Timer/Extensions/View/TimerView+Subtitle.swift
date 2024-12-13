//
//  TimerView+Subtitle.swift
//  Timer
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

extension TimerView {
    var subtitle: some View {
        Text(store.subtitle, bundle: .module)
            .font(.headline)
            .foregroundStyle(Color(.subtitle))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TimerView(
        store: Store(initialState: TimerFeature.State(
            duration: .seconds(10)
        )) {
            TimerFeature()
        }
    )
}
