# mapbox-navigation-native-ios

### Prerequisites

Before you can download the [Mapbox Navigation Native](https://github.com/mapbox/mapbox-navigation-native) for iOS, you need to create a token with `DOWNLOAD:READ` scope.
Go to https://account.mapbox.com and click "Create token"

##### SPM, CocoaPods and Carthage
Insert or append the following to `~/.netrc`

```bash
machine api.mapbox.com
  login mapbox
  password <TOKEN WITH DOWNLOAD:READ SCOPE>
```

## Integration

##### Swift Package Manager

###### Using SPM Package

```swift
.package(url: "git@github.com:mapbox/mapbox-navigation-native-ios.git", from: "324.13.0-SNAPSHOT-04-17--04-29.git-884495a-SNAPSHOT.0418T1946Z.2fd4865"),
```

##### CocoaPods

```ruby
pod 'MapboxNavigationNative', '324.13.0-SNAPSHOT-04-17--04-29.git-884495a-SNAPSHOT.0418T1946Z.2fd4865'
```

##### Carthage

Add the following code to your Cartfile.

```bash
binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == 324.13.0-SNAPSHOT-04-17--04-29.git-884495a-SNAPSHOT.0418T1946Z.2fd4865
binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == 24.13.0-SNAPSHOT-04-17--04-29.git-884495a
```

Then run the following command in the Terminal.
```bash
carthage update --platform ios --use-netrc
```
