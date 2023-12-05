// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

let version = "1.0.0-SNAPSHOT.1204T1710Z.88ce6d1"
let mapboxCommonVersion = Version("24.0.0") 
let checksum = "ab31c6a05a638e3840220ad2abaa218dd2ee865bf0c47511f70067ff48f8e45e"

let package = Package(
    name: "MapboxNavigationNative",
    platforms: [.iOS(.v10)],
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
        registry.mapboxNavigationNativeTarget(version: version, checksum: checksum),
        .testTarget(
            name: "MapboxNavigationNativeTests",
            dependencies: ["MapboxNavigationNative"]
        )
    ],
    cxxLanguageStandard: .cxx14
)
