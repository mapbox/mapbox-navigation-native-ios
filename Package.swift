// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "324.28.0-SNAPSHOT-08-11--16-50.git-228c56f"
let mapboxCommonVersion = Version("24.28.0-SNAPSHOT-08-11--16-50.git-228c56f")
let checksum = "2fa6d8669347869e00e8b8e67db1fc2e50f1fdf9a560aa3c571bfa0b40e1d7b7"
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
