// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Submissions",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Submissions",
            targets: ["Submissions"]
        )
    ],
    dependencies: [
        .package(path: "../../Dependencies/UsersAPIClient"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: .init(1, 0, 0))
    ],
    targets: [
        .target(
            name: "Submissions",
            dependencies: [
                "UsersAPIClient",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            resources: [
                .process("Resources/")
            ]
        )
    ]
)
