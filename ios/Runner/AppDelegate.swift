import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "methodChannelA", binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "methodA" else {
                result(FlutterMethodNotImplemented)
                return
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func methodA() {
        NSLog("hehehe", "${key} = ${value}")
    }
    
    
    private func methodB(number: Dictionary<String, Array<Int>>) -> Int {
        number.forEach { (key: String, value: Array<Int>) in
            NSLog("hehehe", "${key} = ${value}")
        };
        return 1000
    }
}
struct AB {
    
}

struct A {
}
