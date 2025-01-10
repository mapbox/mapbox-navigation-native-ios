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
.package(url: "git@github.com:mapbox/mapbox-navigation-native-ios.git", from: "323.0.0-SNAPSHOT-01-10--04-28.git-23fe4d4-SNAPSHOT.0110T1642Z.40862be"),
```

##### CocoaPods

```ruby
pod 'MapboxNavigationNative', '323.0.0-SNAPSHOT-01-10--04-28.git-23fe4d4-SNAPSHOT.0110T1642Z.40862be'
```

##### Carthage

Add the following code to your Cartfile.

```bash
binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == 323.0.0-SNAPSHOT-01-10--04-28.git-23fe4d4-SNAPSHOT.0110T1642Z.40862be
binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == 24.10.0-beta.1
```

Then run the following command in the Terminal.
```bash
carthage update --platform ios --use-netrc
```
