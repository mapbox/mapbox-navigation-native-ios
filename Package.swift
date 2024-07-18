// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "315.0.0-SNAPSHOT.0718T1416Z.2b4949e"
let mapboxCommonVersion = Version("24.6.0-beta.1")
let checksum = "03a7e91df65f9e29b61c01f0ff579f7bd88d0399df9fae3aeb802d0d22484fde"

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
