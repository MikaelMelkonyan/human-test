//
//  APIClient.swift
//
//
//  Created by Mikael Melkonyan on 9/10/24.
//

import Foundation
import ComposableArchitecture

public final actor APIClient {
    public var domain: String?
    public var version: String?
    
    let session = URLSession(configuration: .default)
    let jsonDecoder = JSONDecoder()
    
    public func configure(
        with domain: String,
        version: String? = nil
    ) {
        self.domain = domain
        self.version = version
    }
    
    func baseURL() throws -> String {
        guard let domain else {
            throw APIError(description: "Domain is not set. Please set it in the configuration using `APIClient.configure` method.")
        }
        var url = domain
        if let version {
            url += version
        }
        return url
    }
}

// MARK: - Dependency
extension APIClient: DependencyKey {
    public static var liveValue: APIClient = APIClient()
}

extension DependencyValues {
    public var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}
