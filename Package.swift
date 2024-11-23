// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Kajalluthra/LoggerExtension.git",  from: "3.0.0"),
        .package(url: "https://github.com/luximetr/AnyFormatKit.git", from: "2.5.2"),
        .package(url: "https://github.com/launchdarkly/ios-client-sdk.git", from: "9.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Core",
            dependencies: ["LoggerExtension", "AnyFormatKit", .product(name: "LaunchDarkly", package: "ios-client-sdk")]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"],
            resources: [.process("json")]),
    ]
)
