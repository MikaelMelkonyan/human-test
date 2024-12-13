//
//  AppDelegate.swift
//  Human-Test
//
//  Created by Mikael Melkonyan on 12/13/24.
//

import UIKit
import ComposableArchitecture

import APIClient

final class AppDelegate: NSObject, UIApplicationDelegate {
    @Dependency(\.apiClient) private var apiClient: APIClient
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // API Client
        Task {
            await apiClient.configure(with: Constants.API.domain, version: nil)
        }
        return true
    }
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(name: "Scene Configuration", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self
        return sceneConfiguration
    }
}
