//
//  MarketCapView.swift
//  SubmissionsModule
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture
import Charts

public struct MarketCapView: View {
    public let store: StoreOf<MarketCapFeature>
    
    public init(store: StoreOf<MarketCapFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Text(store.value.formatted(
                .currency(code: store.currencyCode)
            ))
            
            chart
        }
    }
}

// MARK: - Private
private extension MarketCapView {
    var chart: some View {
        Chart(store.capByDates) { capitalization in
            AreaMark(
                x: .value(.init(stringLiteral: ""), capitalization.date),
                y: .value(.init(stringLiteral: ""), capitalization.value)
            )
            .foregroundStyle(Gradient(colors: [
                Color(.chartGradientStart),
                Color(.chartGradientEnd)
            ]))
            .interpolationMethod(.catmullRom)
            
            LineMark(
                x: .value(.init(stringLiteral: ""), capitalization.date),
                y: .value(.init(stringLiteral: ""), capitalization.value)
            )
            .foregroundStyle(Color(.chartBorder))
            .interpolationMethod(.catmullRom)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(width: 100, height: 50)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MarketCapView(
        store: Store(initialState: .mock) {
            MarketCapFeature()
        }
    )
}
