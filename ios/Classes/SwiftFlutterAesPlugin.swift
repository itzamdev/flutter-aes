import Flutter
import UIKit

public class SwiftFlutterAesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ec.itzam/flutter_aes", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    
    // Load the AES module
    let AES = CryptoJS.AES()
    
    
    let args = call.arguments as? [String: Any]
    
    let plainText: String = args?["plainText"] as! String
    let CRYPTO_SECRET: String = args?["key"] as! String
    
    if(call.method == "encrypt"){
        // Basic AES encryption
        let encrypted = AES.encrypt(plainText,password: CRYPTO_SECRET)
        result (encrypted)
    }else if(call.method == "decrypt"){
        // Basic AES encryption
        let decrypted = AES.decrypt(plainText,password: CRYPTO_SECRET)
        result (decrypted)
    } else {
        result(FlutterMethodNotImplemented)
    }
    
    
  }
}
