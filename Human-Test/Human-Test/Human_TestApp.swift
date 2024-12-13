//
//  Human_TestApp.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/12/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct Human_TestApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(initialState: RootFeature.State()) {
                    RootFeature()
                }
            )
        }
    }
}
