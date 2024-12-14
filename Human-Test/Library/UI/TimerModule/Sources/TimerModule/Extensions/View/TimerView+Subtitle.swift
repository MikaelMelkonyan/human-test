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
        text
            .font(.headline)
            .foregroundStyle(Color(.subtitle))
    }
}

// MARK: - Private
private extension TimerView {
    var text: Text {
        switch store.durationRemaining.components.seconds {
        case 0:
            Text("You will be notified soon", bundle: .module)
        case 1...60:
            Text("Submissions close in a few seconds", bundle: .module)
        case 61...3600:
            Text("Submissions close in a few minutes", bundle: .module)
        default:
            Text("Submissions close in a few hours", bundle: .module)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TimerView(
        store: Store(initialState: TimerFeature.State(
            duration: .seconds(61)
        )) {
            TimerFeature()
        }
    )
}
