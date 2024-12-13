//
//  SubmissionFeature.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct SubmissionFeature: Sendable {
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.userInfo, action: \.userInfo) {
            UserInfoFeature()
        }
    }
}

// MARK: - State
extension SubmissionFeature {
    @ObservableState
    public struct State: Equatable, Identifiable {
        public let id: Id = Id()
        public init(userInfo: UserInfoFeature.State) {
            self.userInfo = userInfo
        }
        
        public var userInfo: UserInfoFeature.State
    }
    
    public struct Id: Hashable, Sendable {
        let value: UUID = UUID()
    }
}

// MARK: - Mocks
extension IdentifiedArrayOf where Element == SubmissionFeature.State {
    static var mock: Self {
        return [
            .mock, .mock, .mock, .mock, .mock,
            .mock, .mock, .mock, .mock, .mock
        ]
    }
}

extension SubmissionFeature.State {
    static var mock: Self {
        return .init(userInfo: .mock)
    }
}

// MARK: - Action
extension SubmissionFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case userInfo(Never)
    }
}
