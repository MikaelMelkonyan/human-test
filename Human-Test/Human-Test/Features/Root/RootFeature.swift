//
//  RootFeature.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import ComposableArchitecture
import SwiftUI

import TimerModule
import SubmissionsModule

@Reducer
struct RootFeature {
    var body: some ReducerOf<Self> {
        Scope(state: \.timer, action: \.timer) {
            TimerFeature()
        }
        Scope(state: \.submissions, action: \.submissions) {
            SubmissionsFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .timer(.didCloseSubmission):
                state.submissions.isLocked = true
                return .none
            default:
                return .none
            }
        }
    }
}

// MARK: - State
extension RootFeature {
    @ObservableState
    struct State: Equatable {
        var timer: TimerFeature.State = TimerFeature.State(duration: .seconds(6 * 60 * 60))
        var submissions: SubmissionsFeature.State = SubmissionsFeature.State()
    }
}

// MARK: - Action
extension RootFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case timer(TimerFeature.Action)
        case submissions(SubmissionsFeature.Action)
    }
}
