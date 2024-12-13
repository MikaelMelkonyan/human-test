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
                return loadSubmissionsEffect()
            case .refresh:
                state.isLoading = true
                state.items = .mock
                return loadSubmissionsEffect()
            case let .didGetSubmissions(submissions):
                state.isLoading = false
                state.items = IdentifiedArray(uniqueElements: submissions)
                return .none
            default:
                return .none
            }
        }
        .forEach(\.items, action: \.items) {
            SubmissionFeature()
        }
    }
    
    private func loadSubmissionsEffect() -> Effect<SubmissionsListFeature.Action> {
        return .run { send in
            do {
                let users = try await apiClient.users()
                if users.isEmpty {
                } else {
                    let submissions: [SubmissionFeature.State] = users.map { user in
                        return SubmissionFeature.State(
                            userInfo: UserInfoFeature.State(
                                fullName: user.name,
                                username: user.username
                            )
                        )
                    }
                    await send(.didGetSubmissions(submissions))
                }
            } catch {
            }
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
        var items: IdentifiedArrayOf<SubmissionFeature.State> = .mock
    }
}

// MARK: - Action
extension SubmissionsListFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case onTask
        case refresh
        
        case didGetSubmissions([SubmissionFeature.State])
        
        case items(IdentifiedActionOf<SubmissionFeature>)
    }
}
