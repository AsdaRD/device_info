import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceInfo = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDeviceInfo() async {
    String deviceInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      deviceInfo = await DeviceInfo.getDeviceInfo();
    } on PlatformException {
      deviceInfo = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _deviceInfo,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
