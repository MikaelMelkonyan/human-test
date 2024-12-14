//
//  UsersAPIClient.swift
//
//
//  Created by Mikael Melkonyan on 9/10/24.
//

import Foundation
import ComposableArchitecture

import APIClient
import UserEntity

public final actor UsersAPIClient {
    @Dependency(\.apiClient) private var apiClient: APIClient
    
    private let path: String = "users"
    
    public func users() async throws -> [User] {
        try await apiClient.response(path: path, method: .get)
    }
}

// MARK: - Dependency
extension UsersAPIClient: DependencyKey {
    public static var liveValue: UsersAPIClient = UsersAPIClient()
}

extension DependencyValues {
    public var usersAPIClient: UsersAPIClient {
        get { self[UsersAPIClient.self] }
        set { self[UsersAPIClient.self] = newValue }
    }
}
