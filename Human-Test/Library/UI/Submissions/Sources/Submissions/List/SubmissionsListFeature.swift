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
    }
}

// MARK: - State
extension SubmissionsListFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }
}

// MARK: - Action
extension SubmissionsListFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
    }
}
