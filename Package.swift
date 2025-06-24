// swift-tools-version:5.3

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
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "11.2.0")
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
            dependencies: ["ParadigmUtilities"]
        ),
    ]
)
