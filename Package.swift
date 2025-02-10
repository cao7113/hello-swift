// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelloSwift",
    // products: [
    //     .executable(name: "Hello", targets: ["Hello"])
    // ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Hello",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        // PlayingCard Dealer
        .executableTarget(
            name: "Dealer",
            dependencies: [
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser")
            ],
            exclude: ["README.md"]
        ),

        // Tests
        .testTarget(name: "Learning"),
        .testTarget(name: "DealerTests", dependencies: ["Dealer"]),
    ]
)
