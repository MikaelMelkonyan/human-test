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
    
    public var body: some ReducerOf<MarketCapFeature> {
    }
}

// MARK: - State
extension MarketCapFeature {
    @ObservableState
    public struct State: Equatable {
        let currencyCode: String
        let value: Double
        
        public init(currencyCode: String, value: Double) {
            self.currencyCode = currencyCode
            self.value = value
        }
    }
}

// MARK: - Mock
extension MarketCapFeature.State {
    static var mock: Self {
        return .init(
            currencyCode: "USD",
            value: 2440.5
        )
    }
}

// MARK: - Action
extension MarketCapFeature {
    @CasePathable
    @dynamicMemberLookup
    public enum Action: Equatable {
    }
}
