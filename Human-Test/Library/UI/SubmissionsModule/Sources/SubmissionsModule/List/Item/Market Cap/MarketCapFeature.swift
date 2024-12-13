//
//  MarketCapFeature.swift
//  SubmissionsModule
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct MarketCapFeature {
    public init() {}
    
    public func reduce(into state: inout State, action: Never) -> Effect<Never> {}
}

// MARK: - State
extension MarketCapFeature {
    @ObservableState
    public struct State: Equatable {
        let currencyCode: String
        let value: Double
        
        let capByDates: [MarketCapitalization]
        
        public init(currencyCode: String, value: Double, capByDates: [MarketCapitalization]) {
            self.currencyCode = currencyCode
            self.value = value
            self.capByDates = capByDates
        }
    }
    
    public struct MarketCapitalization: Equatable, Identifiable {
        public let id: Id = Id()
        public let date: Date
        public let value: Double
        
        public init(date: Date, value: Double) {
            self.date = date
            self.value = value
        }
        
        public struct Id: Hashable {
            let value: UUID = UUID()
        }
    }
}

// MARK: - Mock
extension MarketCapFeature.State {
    static var mock: Self {
        return .init(
            currencyCode: "USD",
            value: 2440.5,
            capByDates: [
                .init(date: Date().addingTimeInterval(-9), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-8), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-7), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-6), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-5), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-4), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-3), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-2), value: mockCapitalization),
                .init(date: Date().addingTimeInterval(-1), value: mockCapitalization),
                .init(date: Date(), value: mockCapitalization)
            ]
        )
    }
    
    private static let mockRange: [Double] = [
        300, 1000, 2200, 2400, 2000, 1800, 2000.0, 2040.5, 2440.5, 1440.5
    ]
    
    private static var mockCapitalization: Double {
        mockRange.randomElement() ?? mockRange.first ?? 0
    }
}
