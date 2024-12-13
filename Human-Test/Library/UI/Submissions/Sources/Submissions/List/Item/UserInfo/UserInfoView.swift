//
//  UserInfoView.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

public struct UserInfoView: View {
    public let store: StoreOf<UserInfoFeature>
    
    public init(store: StoreOf<UserInfoFeature>) {
        self.store = store
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            userPicture
            
            VStack(alignment: .leading, spacing: 8) {
                fullName
                
                username
            }
        }
    }
}

// MARK: - Private
private extension UserInfoView {
    var userPicture: some View {
        Image(store.userPicture, bundle: .module)
            .resizable()
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
    var fullName: some View {
        Text(store.fullName)
            .font(.system(.headline))
            .foregroundStyle(Color(.fullName))
    }
    
    var username: some View {
        Text(store.username)
            .font(.subheadline)
            .foregroundStyle(Color(.username))
    }
}

#if DEBUG
#Preview(traits: .sizeThatFitsLayout) {
    UserInfoView(
        store: Store(initialState: .mock) {
            UserInfoFeature()
        }
    )
}
#endif
