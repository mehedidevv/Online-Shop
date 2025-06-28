import UIKit
import Flutter
import GoogleMaps // ✅ Import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // ✅ Provide your Google Maps API key here
    GMSServices.provideAPIKey("AIzaSyDhzY2k-tIrpnoBut75TTDJTuE1kURA_fU")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
