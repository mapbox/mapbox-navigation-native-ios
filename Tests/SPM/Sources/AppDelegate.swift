import UIKit
import MapboxNavigationNative


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      assert(String(describing: Navigator.self) == "Navigator")
      return true
    }
}
