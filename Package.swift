// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.20.1-SNAPSHOT-03-28--12-09.git-13ddd7c"
let mapboxCommonVersion = Version("24.20.1-SNAPSHOT-03-28--12-09.git-13ddd7c")
let checksum = "d3acb19d3887434c5ffa0becd131a0b4fddc4768633b9b31d1cfbff76dee6f8c"
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
