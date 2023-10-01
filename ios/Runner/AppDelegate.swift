/*
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}*/


import UIKit
import Flutter

/*
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Function to open MyViewController as a modal view controller
  func openMyViewController() {
    let flutterViewController = window?.rootViewController as! FlutterViewController
    let myViewController = MyViewController() // Initialize MyViewController
    flutterViewController.present(myViewController, animated: true, completion: nil)
  }
}
*/
 @UIApplicationMain
import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func application(_ application: NSApplication, didFinishLaunchingWithOptions launchOptions: [NSApplication.LaunchOptionsKey: Any]?) -> Bool {
        let flutterViewController = FlutterViewController.init()

        // Register the FlutterViewController
        GeneratedPluginRegistrant.register(with: flutterViewController)

        // Create a FlutterEngine
        let flutterEngine = FlutterEngine(name: "my flutter engine")
        flutterEngine.run()

        // Attach the FlutterViewController to the window
        let window = NSWindow.init(contentViewController: flutterViewController)
        window.title = "Flutter macOS App"
        window.frame = NSRect(x: 100, y: 100, width: 800, height: 600)
        window.makeKeyAndOrderFront(nil)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Other methods, if needed
}

