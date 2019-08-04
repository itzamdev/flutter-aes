import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_aes/flutter_aes.dart';

void main() {
  const MethodChannel channel = MethodChannel('ec.itzam/flutter_aes');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('encrypt', () async {
    expect(await AES.encrypt(aesSecret: "laslaskjdcxjxsa",data: "hola mundo"), '42');
  });
}
