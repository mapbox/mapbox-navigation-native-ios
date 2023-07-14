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
.package(url: "git@github.com:mapbox/mapbox-navigation-native-ios.git", from: "main-SNAPSHOT-26322d31be78938c2a755dbf17447a3f70233290"),
```

##### CocoaPods

```ruby
pod 'MapboxNavigationNative', 'main-SNAPSHOT-26322d31be78938c2a755dbf17447a3f70233290'
```

##### Carthage

Add the following code to your Cartfile.

```bash
binary "https://api.mapbox.com/downloads/v2/carthage/mobile-navigation-native/MapboxNavigationNative.json" == main-SNAPSHOT-26322d31be78938c2a755dbf17447a3f70233290
binary "https://api.mapbox.com/downloads/v2/carthage/mapbox-common/MapboxCommon-ios.json" == 23.7.0-beta.1
```

Then run the following command in the Terminal.
```bash
carthage update --platform ios --use-netrc
```
