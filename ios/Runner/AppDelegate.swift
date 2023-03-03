import UIKit
import Flutter
import FirebaseCore
import AppTrackingTransparency

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func applicationDidBecomeActive(_ application: UIApplication) {
            if #available(iOS 15.0, *) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        
                })
            }
        }
}
