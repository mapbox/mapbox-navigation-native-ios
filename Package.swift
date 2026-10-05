// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.34.0-SNAPSHOT-10-05--11-47.git-16a5d06"
let mapboxCommonVersion = Version("24.34.0-SNAPSHOT-10-05--11-47.git-16a5d06")
let checksum = "4038b8ae7cbc99f6f2a0dbfa59d9b0d0f26ed13b5e0a8e39fbcd928e9c8d9090"
let releaseType = "snapshots"

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
        .package(name: "MapboxCommon", url: "https://github.com/mapbox/mapbox-common-ios.git", .exact(mapboxCommonVersion)),
    ],
    targets: [
        .target(
            name: "MapboxNavigationNativeWrapper",
            dependencies: ["MapboxCommon", "MapboxNavigationNative"]
        ),
        .binaryTarget(
            name: "MapboxNavigationNative",
            url: "https://api.mapbox.com/downloads/v2/dash-native/\(releaseType)/ios/packages/\(version)/MapboxNavigationNative.xcframework.zip",
            checksum: checksum
        )
    ],
    cxxLanguageStandard: .cxx14
)
