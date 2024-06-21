// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "313.0.0-SNAPSHOT.0621T0910Z.3b8edb7"
let mapboxCommonVersion = Version("24.5.0-rc.1")
let checksum = "005ec4ca39693815a6acdc1cf82dc3e450e540c6d7b45e5d16058d41760633c0"

let package = Package(
    name: "MapboxNavigationNative",
    platforms: [.iOS(.v12)],
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
