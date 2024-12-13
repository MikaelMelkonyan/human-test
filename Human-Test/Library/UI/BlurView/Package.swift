// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "BlurView",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "BlurView",
            targets: ["BlurView"]
        )
    ],
    targets: [
        .target(
            name: "BlurView"
        )
    ]
)
