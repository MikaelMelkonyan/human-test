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
                .init(date: Date().addingTimeInterval(-6), value: 2400),
                .init(date: Date().addingTimeInterval(-5), value: 2000),
                .init(date: Date().addingTimeInterval(-4), value: 1800),
                .init(date: Date().addingTimeInterval(-3), value: 2000.0),
                .init(date: Date().addingTimeInterval(-2), value: 2040.5),
                .init(date: Date().addingTimeInterval(-1), value: 2440.5),
                .init(date: Date(), value: 1440.5)
            ]
        )
    }
}
