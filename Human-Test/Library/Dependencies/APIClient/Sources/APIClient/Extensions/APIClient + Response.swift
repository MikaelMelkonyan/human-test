//
//  APIClient + Response.swift
//  APIClient
//
//  Created by Mikael Melkonyan on 10/14/24.
//

import Foundation

public extension APIClient {
    func response<Success: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: [String: Any]? = nil
    ) async throws -> Success {
        let baseURL = try baseURL()
        var request = request(url: baseURL + path, method: method, headers: headers, parameters: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await response(request: request)
    }
}

// MARK: - Private
private extension APIClient {
    func response<Success: Decodable>(
        request: URLRequest
    ) async throws -> Success {
        let (data, _) = try await session.data(for: request)
        do {
            let decodedData = try jsonDecoder.decode(Success.self, from: data)
            return decodedData
        } catch {
            throw APIError(error: error)
        }
    }
}
