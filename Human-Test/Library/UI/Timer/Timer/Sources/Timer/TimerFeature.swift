//
//  TimerFeature.swift
//  Timer
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct TimerFeature: Sendable {
    public init() {}
    
    @Dependency(\.continuousClock) var clock
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onTask:
                return .run { send in
                    for await _ in self.clock.timer(interval: .seconds(1)) {
                        await send(.timerTick, animation: .easeInOut)
                    }
                }
                .cancellable(id: TimerId.current)
            case .timerTick:
                state.secondsElapsed += 1
                if state.secondsElapsed == state.duration.components.seconds {
                    return .cancel(id: TimerId.current)
                } else {
                    return .none
                }
            }
        }
    }
    
    private enum TimerId {
        case current
    }
}

// MARK: - State
extension TimerFeature {
    @ObservableState
    public struct State: Equatable {
        let duration: Duration
        public init(duration: Duration) {
            self.duration = duration
        }
        
        let subtitle: LocalizedStringKey = "Subtitle"
        
        var secondsElapsed = 0
        var durationRemaining: Duration {
            duration - .seconds(secondsElapsed)
        }
    }
}

// MARK: - Action
extension TimerFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case onTask
        case timerTick
    }
}

