// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XPCSquirrel",
    dependencies: [
    ],
    targets: [
        .target(
            name: "XPCSquirrel",
            dependencies: []),
        .testTarget(
            name: "XPCSquirrelTests",
            dependencies: ["XPCSquirrel"]),
        .target(
            name: "ServiceProvider",
            dependencies: []),
    ]
)
