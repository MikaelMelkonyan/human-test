//
//  LockIconView.swift
//  Submissions
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

struct LockIconView: View {
    var body: some View {
        Image(systemName: "lock.circle.fill")
            .renderingMode(.original)
            .resizable()
            .frame(width: 54, height: 54)
            .foregroundStyle(Color(.lockIcon))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LockIconView()
}
