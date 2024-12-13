//
//  RootFeature.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import ComposableArchitecture
import SwiftUI

import Timer

@Reducer
struct RootFeature: Sendable {
    var body: some ReducerOf<Self> {
        Scope(state: \.timer, action: \.timer) {
            TimerFeature()
        }
    }
}

// MARK: - State
extension RootFeature {
    @ObservableState
    struct State: Equatable {
        var timer: TimerFeature.State = .init(duration: .seconds(6 * 60 * 60))
    }
}

// MARK: - Action
extension RootFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case timer(TimerFeature.Action)
    }
}
