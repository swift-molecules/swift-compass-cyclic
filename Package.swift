// swift-tools-version: 6.3.3
import PackageDescription

let package = Package(
    name: "swift-compass-cyclic-primitives",
    platforms: [.macOS("27"), .iOS("27"), .tvOS("27"), .watchOS("27"), .visionOS("27")],
    products: [
        .library(name: "Compass Cyclic Primitives", targets: ["Compass Cyclic Primitives"]),
        .library(name: "Compass Cyclic Primitives Test Support", targets: ["Compass Cyclic Primitives Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-compass-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-cyclic-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-ordinal-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Compass Cyclic Primitives",
            dependencies: [
                .product(name: "Compass Primitives", package: "swift-compass-primitives"),
                .product(name: "Cyclic Primitives", package: "swift-cyclic-primitives"),
                .product(name: "Ordinal Primitives", package: "swift-ordinal-primitives"),
            ]
        ),
        .target(name: "Compass Cyclic Primitives Test Support", dependencies: ["Compass Cyclic Primitives"], path: "Tests/Support"),
        .testTarget(name: "Compass Cyclic Primitives Tests", dependencies: ["Compass Cyclic Primitives", "Compass Cyclic Primitives Test Support"]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
