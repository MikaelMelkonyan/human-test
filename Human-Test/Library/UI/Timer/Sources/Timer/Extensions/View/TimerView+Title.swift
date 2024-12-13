//
//  TimerVier+Title.swift
//  Timer
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

extension TimerView {
    var title: some View {
        text
            .font(.title)
            .foregroundStyle(Color(.title))
    }
}

private extension TimerView {
    var text: Text {
        if store.durationRemaining.components.seconds == 0 {
            Text("Submission closed!", bundle: .module)
        } else {
            Text(store.durationRemaining.formatted())
        }
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
