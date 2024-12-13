//
//  SubmissionsFeature.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct SubmissionsFeature: Sendable {
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.list, action: \.list) {
            SubmissionsListFeature()
        }
    }
}

// MARK: - State
extension SubmissionsFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
        
        public var isLocked: Bool = false
        public var list: SubmissionsListFeature.State = SubmissionsListFeature.State()
    }
}

// MARK: - Action
extension SubmissionsFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
        case list(SubmissionsListFeature.Action)
    }
}
