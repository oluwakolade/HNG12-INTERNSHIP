import Flutter
import UIKit


@UIApplicationMain

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
        let urlLauncherChannel = FlutterMethodChannel(name: "url_launcher",
                                                      binaryMessenger: controller.binaryMessenger)
        urlLauncherChannel.setMethodCallHandler { (call, result) in
            if call.method == "openUrl" {
                if let urlString = (call.arguments as? [String: Any])?["url"] as? String,
                   let url = URL(string: urlString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_URL", message: "URL is invalid", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
