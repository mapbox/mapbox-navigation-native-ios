// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "313.0.0-SNAPSHOT.0624T1841Z.9a21e4d"
let mapboxCommonVersion = Version("24.5.0-rc.1")
let checksum = "fbaa8241655c5316cd9f10858e5e949d10c1e0d637c5a43dc701eef635ac4546"

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
