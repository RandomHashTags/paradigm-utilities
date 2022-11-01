// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "paradigm-utilities",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ParadigmUtilities",
            targets: ["ParadigmUtilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/randomhashtags/swift-sovereign-states.git", from: "1.1.5"),
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "9.0.0"),
        .package(url: "https://github.com/michaeleisel/ZippyJSON.git", from: "1.2.5"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ParadigmUtilities",
            dependencies: [
                .product(name: "SwiftSovereignStates", package: "swift-sovereign-states"),
                .product(name: "GEOSwift", package: "GEOSwift"),
                .product(name: "ZippyJSON", package: "ZippyJSON")
            ]),
        .testTarget(
            name: "ParadigmUtilitiesTests",
            dependencies: ["ParadigmUtilities"]),
    ]
)
