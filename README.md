Device_info
Flutter plugin providing device information (Device name, model, OS, OS API(for Android), RAM, Screen Resolution). 
Platforms: Android, IOS.

Installing: 
Add dependence to `pubspeck.yaml`
```dart
dependencies:
  device_info_plus: ^8.0.0
```

Import `package:device_info/device_info.dart`, instantiate DeviceInfo and use the Android and iOS getters to get platform-specific device information.

Example:
```dart
import 'package:device_info/device_info.dart';
String deviceInfo = await DeviceInfo.getDeviceInfo();
print(deviceInfo);  // e.g. "Device: Iphone 14 Pro Max, OS: IOS 16.1, Ram: 6Gb, Screen Resolution: 430 x 932"
String deviceName = await DeviceInfo.getDeviceName();
print(deviceName);  // e.g. "Galaxy S10"
String deviceModel = await DeviceInfo.getModel();
print(deviceModel);  // e.g. "SM-G973F"
String deviceOS = await DeviceInfo.getOS();
print(deviceModel);  // e.g. "IOS 12.5.6"
String androidApi = await DeviceInfo.getApi();
print(androidApi);  // e.g. 31 (int)
String deviceRam = await DeviceInfo.getRam();
print(deviceRam);  // e.g. 8 (int)
String deviceScreenResolution = await DeviceInfo.getScreenResolution();
print(deviceScreenResolution);  // e.g. "2723 x 1440"

 






```
