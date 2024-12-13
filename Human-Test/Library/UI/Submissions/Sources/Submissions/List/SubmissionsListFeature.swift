//
//  SubmissionsListFeature.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct SubmissionsListFeature: Sendable {
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
        .forEach(\.items, action: \.items) {
            SubmissionFeature()
        }
    }
}

// MARK: - State
extension SubmissionsListFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
        
        var isLoading: Bool = false
        var items: IdentifiedArrayOf<SubmissionFeature.State> = [
            .mock, .mock, .mock, .mock, .mock,
            .mock, .mock, .mock, .mock, .mock,
            .mock, .mock, .mock, .mock, .mock
        ]
    }
}

// MARK: - Action
extension SubmissionsListFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case items(IdentifiedActionOf<SubmissionFeature>)
    }
}
