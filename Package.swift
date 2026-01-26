// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.19.0-SNAPSHOT-01-26--06-35.git-fb24d2a"
let mapboxCommonVersion = Version("24.19.0-SNAPSHOT-01-26--06-35.git-fb24d2a")
let checksum = "c8dedd86dec9e862cd5bee1426e9c7eab6842007e268971766f6d1bb2bf5289a"
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
