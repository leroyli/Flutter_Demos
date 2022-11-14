import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var channel: MethodChannelManager!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller: FlutterViewController = window.rootViewController as! FlutterViewController
      let nav = UINavigationController.init(rootViewController: controller)
      self.window.rootViewController = nav
     channel = MethodChannelManager.init(messager: controller.binaryMessenger)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
