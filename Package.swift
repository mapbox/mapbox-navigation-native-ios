// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.36.0-SNAPSHOT-11-16--16-10.git-049f6e4"
let mapboxCommonVersion = Version("24.36.0-SNAPSHOT-11-16--16-10.git-049f6e4")
let checksum = "ee7aa6a71926d9b5ce8a040ee8f3455956087761bdcbc86f43f3c3f4d015bf97"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxNavigationNative",
    // The NavNative SDK doesn't support macOS but declares the minimum macOS requirement with downstream dependencies to enable `swift run` CLI tools
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "MapboxNavigationNative",
            targets: ["MapboxNavigationNativeWrapper"]
        ),
        .library(
            name: "DirectionsGenerated",
            targets: ["DirectionsGenerated"]
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
        // Pure Swift: must not depend on the binary target or MapboxCommon, so it builds on macOS.
        // Sources are copied in by publish_package_swift.py.
        .target(
            name: "MapboxFlatBuffers"
        ),
        .target(
            name: "DirectionsGenerated",
            dependencies: ["MapboxFlatBuffers"]
        ),
        .binaryTarget(
            name: "MapboxNavigationNative",
            url: "https://api.mapbox.com/downloads/v2/dash-native/\(releaseType)/ios/packages/\(version)/MapboxNavigationNative.xcframework.zip",
            checksum: checksum
        )
    ],
    cxxLanguageStandard: .cxx14
)
