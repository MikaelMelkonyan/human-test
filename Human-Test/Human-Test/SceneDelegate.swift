//
//  SceneDelegate.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import UIKit
import SwiftUI
import ComposableArchitecture

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let rootStore = Store(initialState: RootFeature.State()) {
        RootFeature()
    }
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            presentRootFeature(in: window)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

// MARK: - Private
private extension SceneDelegate {
    func presentRootFeature(in window: UIWindow) {
        let rootView = RootView(store: rootStore)
        let hostingController = UIHostingController(rootView: rootView)
        window.rootViewController = hostingController
    }
}
