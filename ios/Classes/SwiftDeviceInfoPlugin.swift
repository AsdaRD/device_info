import Flutter
import UIKit
import Foundation


public class SwiftDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "a.shakh/device_info", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let memory: Int = getMemorySize()
    if(call.method.elementsEqual("getDeviceName")) {
      result(UIDevice.current.name)
    } else if(call.method.elementsEqual("getModel")) {
      result(UIDevice.current.model)
    } else if(call.method.elementsEqual("getOS")) {
      result(UIDevice.current.systemName + UIDevice.current.systemVersion)
    } else if(call.method.elementsEqual("getRam")) {
      result(memory) 
    } else if(call.method.elementsEqual("getScreenResolution")) {
      result("\(Int(UIScreen.main.bounds.width)) x \(Int(UIScreen.main.bounds.height))")
    } else if(call.method.elementsEqual("getDeviceInfo")) {
      result("Device: \(UIDevice.current.name), OS: \(UIDevice.current.systemName) \(UIDevice.current.systemVersion), Ram: \(memory)Gb, Screen resolution: \(Int(UIScreen.main.bounds.width)) x \(Int(UIScreen.main.bounds.height))")
    }
  }

  private func getMemorySize() -> Int{
      let memory : Double = Double(ProcessInfo.processInfo.physicalMemory)
      let constant : Double = 1073741824.0
      let res : Double = memory / constant
      return Int(round(res))
  }
}
