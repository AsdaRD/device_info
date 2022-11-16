import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInfo {
  static const MethodChannel _channel = MethodChannel('a.shakh/device_info');

  static Future<String> getDeviceName() async {
    try {
      final String result = await _channel.invokeMethod('getDeviceName');
      return result;
    } on PlatformException {
      return '';
    }
  }

  static Future<String> getModel() async {
    try {
      final String result = await _channel.invokeMethod('getModel');
      return result;
    } on PlatformException {
      return '';
    }
  }

  static Future<String> getOS() async {
    try {
      final String result = await _channel.invokeMethod('getOS');
      return result;
    } on PlatformException {
      return '';
    }
  }

  static Future<String> getApi() async {
    try {
      final String result = await _channel.invokeMethod('getApi');
      return result;
    } on PlatformException {
      return '';
    }
  }

  static Future<int> getRam() async {
    try {
      final int result = await _channel.invokeMethod('getRam');
      return result;
    } on PlatformException {
      return 0;
    }
  }

  static Future<String> getScreenResolution() async {
    try {
      final String result = await _channel.invokeMethod('getScreenResolution');
      return result;
    } on PlatformException {
      return '';
    }
  }

  static Future<String> getDeviceInfo() async {
    try {
      final String result = await _channel.invokeMethod('getDeviceInfo');
      return result;
    } on PlatformException {
      return '';
    }
  }
}
