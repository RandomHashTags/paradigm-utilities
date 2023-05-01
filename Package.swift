// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "paradigm-utilities",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "ParadigmUtilities",
            targets: ["ParadigmUtilities"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/RandomHashTags/swift-sovereign-states.git", from: "1.3.1"),
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "9.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.76.0"),
    ],
    targets: [
        .target(
            name: "ParadigmUtilities",
            dependencies: [
                .product(name: "SwiftSovereignStates", package: "swift-sovereign-states"),
                .product(name: "GEOSwift", package: "GEOSwift"),
                .product(name: "Vapor", package: "vapor")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ParadigmUtilitiesTests",
            dependencies: ["ParadigmUtilities"]),
    ]
)
