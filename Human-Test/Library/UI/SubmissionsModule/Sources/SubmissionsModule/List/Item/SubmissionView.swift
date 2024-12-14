//
//  SubmissionView.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

public struct SubmissionView: View {
    public let store: StoreOf<SubmissionFeature>
    
    public init(store: StoreOf<SubmissionFeature>) {
        self.store = store
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            UserInfoView(store: store.scope(
                state: \.userInfo,
                action: \.userInfo
            ))
            
            Spacer()
            
            MarketCapView(store: store.scope(
                state: \.marketCap,
                action: \.marketCap
            ))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SubmissionView(
        store: Store(initialState: SubmissionFeature.State(
            userInfo: UserInfoFeature.State.mock
        )) {
            SubmissionFeature()
        }
    )
}
