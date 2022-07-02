// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swiftui-component-builder-experimental",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
  ],
    products: [
         .library(
            name: "ComponentBuilder",
            targets: ["ComponentBuilder"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ComponentBuilder",
            dependencies: []),
        .testTarget(
            name: "ComponentBuilderTests",
            dependencies: ["ComponentBuilder"]),
    ]
)
