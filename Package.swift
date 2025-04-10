// swift-tools-version:5.3

import PackageDescription
// ...........
let package = Package(
    name: "SecuritySuite",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SecuritySuite",
            targets: ["SecuritySuite"]),
    ],
    targets: [
        .target(
            name: "SecuritySuite",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")])
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
