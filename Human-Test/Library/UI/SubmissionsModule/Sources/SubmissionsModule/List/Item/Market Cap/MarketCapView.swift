//
//  MarketCapView.swift
//  SubmissionsModule
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

public struct MarketCapView: View {
    public let store: StoreOf<MarketCapFeature>
    
    public init(store: StoreOf<MarketCapFeature>) {
        self.store = store
    }
    
    public var body: some View {
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MarketCapView(
        store: Store(initialState: .mock) {
            MarketCapFeature()
        }
    )
}
