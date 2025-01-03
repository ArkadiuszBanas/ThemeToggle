// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ThemeToggle",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "ThemeToggle",
            targets: ["ThemeToggle"]),
    ],
    targets: [
        .target(
            name: "ThemeToggle",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ThemeToggleTests",
            dependencies: ["ThemeToggle"]),
    ]
)
