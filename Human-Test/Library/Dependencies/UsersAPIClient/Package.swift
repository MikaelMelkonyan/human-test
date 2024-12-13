// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "UsersAPIClient",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(
            name: "UsersAPIClient",
            targets: ["UsersAPIClient"]
        )
    ],
    dependencies: [
        .package(path: "../APIClient"),
        .package(path: "../../Models/User"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: .init(1, 0, 0))
    ],
    targets: [
        .target(
            name: "UsersAPIClient",
            dependencies: [
                "APIClient",
                "User",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)
