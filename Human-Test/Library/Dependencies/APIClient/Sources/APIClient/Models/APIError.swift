//
//  APIError.swift
//  APIClient
//
//  Created by Mikael Melkonyan on 10/14/24.
//

public struct APIError: Error {
    public let description: String
    
    public init(error: Error) {
        guard let decodingError = error as? DecodingError else {
            description = error.localizedDescription
            return
        }
        switch decodingError {
        case let .dataCorrupted(context), let .keyNotFound(_, context),
            let .typeMismatch(_, context), let .valueNotFound(_, context):
            description = context.debugDescription
        @unknown default:
            description = error.localizedDescription
        }
    }
    
    init(description: String) {
        self.description = description
    }
}
