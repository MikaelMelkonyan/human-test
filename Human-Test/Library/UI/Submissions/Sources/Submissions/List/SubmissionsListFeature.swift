//
//  SubmissionsListFeature.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import ComposableArchitecture
import SwiftUI

import UsersAPIClient

@Reducer
public struct SubmissionsListFeature: Sendable {
    public init() {}
    
    @Dependency(\.usersAPIClient) var apiClient: UsersAPIClient
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onTask:
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
        public init(isLoading: Bool = true) {
            self.isLoading = isLoading
        }
        
        var isLoading: Bool
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
        case onTask
        case items(IdentifiedActionOf<SubmissionFeature>)
    }
}
