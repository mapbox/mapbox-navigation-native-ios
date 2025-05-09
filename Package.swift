// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.13.0-SNAPSHOT-05-09--04-29.git-71aa2d0"
let mapboxCommonVersion = Version("24.13.0-SNAPSHOT-05-09--04-29.git-71aa2d0")
let checksum = "1b3e5e5b5fecfa8a4609891806cab29714e4d743ae5a77b57c391c946d98b15b"
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
        ),
        .testTarget(
            name: "MapboxNavigationNativeTests",
            dependencies: ["MapboxNavigationNative"]
        )
    ],
    cxxLanguageStandard: .cxx14
)
