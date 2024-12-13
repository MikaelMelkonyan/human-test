//
//  UserInfoFeature.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct UserInfoFeature {
    public init() {}
    public func reduce(into state: inout State, action: Never) -> Effect<Never> {}
}

// MARK: - State
extension UserInfoFeature {
    @ObservableState
    public struct State: Equatable {
        public let fullName: String
        public let username: String
        
        public init(
            firstName: String,
            lastName: String,
            username: String
        ) {
            fullName = [firstName, lastName].filter({
                !$0.isEmpty
            }).joined(separator: " ")
            self.username = username
        }
        
        var userPicture: String = "mock-user"
    }
}

#if DEBUG
// MARK: - Mock
extension UserInfoFeature.State {
    static var mock: Self {
        return .init(
            firstName: "John",
            lastName: "Doe",
            username: "john.doe"
        )
    }
}
#endif
