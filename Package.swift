// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.36.0-SNAPSHOT-11-10--16-28.git-e4d9b24"
let mapboxCommonVersion = Version("24.36.0-SNAPSHOT-11-10--16-28.git-e4d9b24")
let checksum = "75cdd9bda2c4874a830eee8e7113722b07a93e6110f264ba6febedb30f8f7b9a"
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
