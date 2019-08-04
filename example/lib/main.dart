import 'package:flutter/material.dart';
import 'package:flutter_aes/flutter_aes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String encrypted = '', decrypted = '';
  final secret = "sweden8-crawlers2-supplier";
  final plainText = "hola mundo";

  @override
  void initState() {
    super.initState();
  }

  encrypt() async {
    final encrypted =
    await AES.encrypt(aesSecret: this.secret, data: this.plainText);
    setState(() {
      this.encrypted = encrypted;
    });
  }

  decrypt() async {
    if (encrypted.isEmpty) return;
    final decrypted =
    await AES.decrypt(aesSecret: this.secret, encrypted: this.encrypted);
    setState(() {
      this.decrypted = decrypted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AES'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("encrypted: $encrypted"),
              Text("decrypted: $decrypted"),
              FlatButton(onPressed: encrypt, child: (Text("ENCRYPT"))),
              FlatButton(onPressed: decrypt, child: (Text("DECRYPT"))),
            ],
          ),
        ),
      ),
    );
  }
}
