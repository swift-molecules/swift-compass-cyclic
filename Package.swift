// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-compass-cyclic",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [
        .library(name: "Compass Cyclic", targets: ["Compass Cyclic"]),
        .library(
            name: "Compass Cyclic Test Support",
            targets: ["Compass Cyclic Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-compass.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-cyclic.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Compass Cyclic",
            dependencies: [
                .product(name: "Compass", package: "swift-compass"),
                .product(name: "Cyclic", package: "swift-cyclic"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),
        .target(
            name: "Compass Cyclic Test Support",
            dependencies: ["Compass Cyclic"],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Compass Cyclic Tests",
            dependencies: ["Compass Cyclic", "Compass Cyclic Test Support"]
        ),
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
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
