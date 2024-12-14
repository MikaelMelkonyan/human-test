//
//  User.swift
//  User
//
//  Created by Mikael Melkonyan on 12/13/24.
//

public struct User: Equatable, Decodable, Sendable {
    public let id: Int
    public let name: String
    public let username: String
    
    public init(id: Int, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}
