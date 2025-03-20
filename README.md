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
.package(url: "git@github.com:mapbox/mapbox-navigation-native-ios.git", from: "324.0.0-SNAPSHOT-03-19--04-29.git-2fcebff-SNAPSHOT.0320T1615Z.811f22a"),
```

##### CocoaPods

```ruby
pod 'MapboxNavigationNative', '324.0.0-SNAPSHOT-03-19--04-29.git-2fcebff-SNAPSHOT.0320T1615Z.811f22a'
```

##### Carthage

Add the following code to your Cartfile.

```bash
binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == 324.0.0-SNAPSHOT-03-19--04-29.git-2fcebff-SNAPSHOT.0320T1615Z.811f22a
binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == 24.11.0-SNAPSHOT-03-19--04-29.git-2fcebff
```

Then run the following command in the Terminal.
```bash
carthage update --platform ios --use-netrc
```
