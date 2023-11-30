// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "paradigm-utilities",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ParadigmUtilities",
            targets: ["ParadigmUtilities"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/RandomHashTags/swift-sovereign-states.git", from: "1.3.2"),
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "10.1.0")
    ],
    targets: [
        .target(
            name: "ParadigmUtilities",
            dependencies: [
                .product(name: "SwiftSovereignStates", package: "swift-sovereign-states"),
                .product(name: "GEOSwift", package: "GEOSwift")
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ParadigmUtilitiesTests",
            dependencies: ["ParadigmUtilities"]),
    ]
)
