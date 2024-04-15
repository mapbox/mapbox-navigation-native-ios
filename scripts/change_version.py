import argparse
import os
import re

ROOT = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')
README = os.path.join(ROOT, 'README.md')
PACKAGE_SWIFT = os.path.join(ROOT, 'Package.swift')
TEST_CARTFILE = os.path.join(ROOT, 'Tests/Carthage/Cartfile')
TEST_PODFILE = os.path.join(ROOT, 'Tests/CocoaPods/Podfile')
TEST_SPM_PROJECT = os.path.join(ROOT, 'Tests/SPM/project.yml')

def change_cocoapods(podfile_contents, version):
    podfile_contents = re.sub(
        r"pod 'MapboxNavigationNative', '.+'", 
        f"pod 'MapboxNavigationNative', '{version}'", 
        podfile_contents)
    return podfile_contents

def change_carthage(cartfile_contents, version, common_version):
    cartfile_contents = re.sub(
        re.escape('binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == ') + '.+',
        f'binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == {version}',
        cartfile_contents
    )
    cartfile_contents = re.sub(
        re.escape('binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == ') + '.+',
        f'binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == {common_version}',
        cartfile_contents
    )
    return cartfile_contents

def change_readme(version, common_version):
    with open(README, 'r') as f:
        readme = f.read()
        readme = re.sub(
            r'\.package\(url: "git@github\.com:mapbox\/mapbox-navigation-native-ios\.git", from: ".+"\),', 
            f'.package(url: "git@github.com:mapbox/mapbox-navigation-native-ios.git", from: "{version}"),', 
            readme)
        readme = change_cocoapods(readme, version=version)
        readme = change_carthage(readme, version=version, common_version=common_version)

    with open(README, 'w') as f:
        f.write(readme)

def change_package_swift(version, common_version, checksum):
    with open(PACKAGE_SWIFT, 'r') as f:
        package_swift = f.read()
        package_swift = re.sub(
            r'let version = ".+"', 
            f'let version = "{version}"', 
            package_swift)
        package_swift = re.sub(
            r'let mapboxCommonVersion = Version\(".+"\)', 
            f'let mapboxCommonVersion = Version("{common_version}")', 
            package_swift)
        package_swift = re.sub(
            r'let checksum = ".+"', 
            f'let checksum = "{checksum}"', 
            package_swift)
    with open(PACKAGE_SWIFT, 'w') as f:
        f.write(package_swift)

def change_test_cartfile(version, common_version):
    with open(TEST_CARTFILE, 'r') as f:
        cartfile = f.read()
        cartfile = change_carthage(cartfile, version=version, common_version=common_version)

    with open(TEST_CARTFILE, 'w') as f:
        f.write(cartfile)

def change_test_podfile(version):
    with open(TEST_PODFILE, 'r') as f:
        podfile = f.read()
        podfile = change_cocoapods(podfile, version=version)

    with open(TEST_PODFILE, 'w') as f:
        f.write(podfile)


def change_test_spm_project(version, common_version):
    with open(TEST_SPM_PROJECT, 'r') as f:
        spm_project = f.read()
        spm_project = re.sub(
            r'MapboxNavigationNative:\n.+version: .+', 
            f'MapboxNavigationNative:\n    version: {version}', 
            spm_project)

    with open(TEST_SPM_PROJECT, 'w') as f:
        f.write(spm_project)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--version', required=True)
    parser.add_argument('--common-version', required=True)
    parser.add_argument('--checksum', required=True)
    
    args = parser.parse_args()

    change_readme(args.version, args.common_version)
    change_package_swift(args.version, args.common_version, args.checksum)
    change_test_cartfile(args.version, args.common_version)
    change_test_podfile(args.version)
    change_test_spm_project(args.version, args.common_version)
