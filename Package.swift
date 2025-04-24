// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.13.0-SNAPSHOT-04-23--04-29.git-3eea307-SNAPSHOT.0424T1735Z.af3fb01"
let mapboxCommonVersion = Version("24.13.0-SNAPSHOT-04-23--05-20.git-ad48dc8")
let checksum = "11e2f3515a2313d79ac8f47c63a22bcf237cb26b797b75a758d74b29af0d2025"

let package = Package(
    name: "MapboxNavigationNative",
    // The NavNative SDK doesn't support macOS but declares the minimum macOS requirement with downstream dependencies to enable `swift run` CLI tools
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "MapboxNavigationNative",
            targets: ["MapboxNavigationNativeWrapper"]
        )
    ],
    dependencies: [
        .package(name: "MapboxCommon", url: "https://github.com/mapbox/mapbox-common-ios.git", .upToNextMajor(from: mapboxCommonVersion)),
    ],
    targets: [
        .target(
            name: "MapboxNavigationNativeWrapper",
            dependencies: ["MapboxCommon", "MapboxNavigationNative"]
        ),
        .binaryTarget(
            name: "MapboxNavigationNative",
            url: "https://api.mapbox.com/downloads/v2/dash-native/snapshots/ios/packages/\(version)/MapboxNavigationNative.xcframework.zip",
            checksum: checksum
        ),
        .testTarget(
            name: "MapboxNavigationNativeTests",
            dependencies: ["MapboxNavigationNative"]
        )
    ],
    cxxLanguageStandard: .cxx14
)
