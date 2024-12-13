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
            .font(.title)
            .foregroundStyle(Color(.title))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TimerView(
        store: Store(initialState: TimerFeature.State(
            duration: .seconds(60)
        )) {
            TimerFeature()
        }
    )
}
