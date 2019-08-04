import 'package:flutter/foundation.dart' show required;
import 'package:flutter/services.dart';

class AES {
  static const _channel = MethodChannel('ec.itzam/flutter_aes');

  static Future<String> encrypt(
      {@required String aesSecret, @required String data}) async {
    String encrypted;
    try {
      encrypted = await _channel
          .invokeMethod('encrypt', {"plainText": data, "key": aesSecret});
    } on PlatformException catch (e) {
      print("error encrypt ${e.message}");
      encrypted = null;
    }
    return encrypted;
  }

  static Future<String> decrypt(
      {@required String aesSecret, @required String encrypted}) async {
    String decrypted;
    try {
      decrypted = await _channel
          .invokeMethod('decrypt', {"plainText": encrypted, "key": aesSecret});
    } on PlatformException catch (e) {
      print("error decrypt ${e.message}");
      decrypted = null;
    }
    return decrypted;
  }
}
