//
//  MethodChannelManager.swift
//  Runner
//
//  Created by Leroy on 2022/11/14.
//

import UIKit
import Flutter

class MethodChannelManager {
    var count = 0
    var channel: FlutterMethodChannel!
    init(messager: FlutterBinaryMessenger) {
        channel = FlutterMethodChannel(name: "leroy", binaryMessenger: messager)
        // the callback after received flutter message
        channel.setMethodCallHandler { call, result in
            if (call.method == "sendData") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name: String = dict["name"] as? String ?? ""
                    let age: Int = dict["age"] as? Int ?? -1
                    result(["name": "hello,\(name)", "age": age])
                }
            }
            if (call.method == "jump") {
                print("call the method jump")
                self.jumpToPage(result: result)
            }
        }
    }
    
    func changeCount() {
        count += 1
        let args = ["count": count]
        channel.invokeMethod("changCount", arguments: args)
    }
    
    func jumpToPage(result: FlutterResult) {
        let window = UIApplication.shared.delegate?.window as? UIWindow
        let vc = NativeController()
        let nav = window?.rootViewController as? UINavigationController
        nav?.pushViewController(vc, animated: true)
        result("jump success")
    }
}
