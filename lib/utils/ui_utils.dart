import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
// import 'package:schmersal_poc/widgets/navbar/navbar_item.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = 0;
  // var orientation = mediaQuery.orientation;
  // if (orientation == Orientation.landscape) {
  //   deviceWidth = mediaQuery.size.height;
  // } else {
  //   deviceWidth = mediaQuery.size.width;
  // }
  deviceWidth = mediaQuery.size.width;
  // print(deviceWidth);
  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }
  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }
  return DeviceScreenType.Mobile;
}

double getDeviceHeight(MediaQueryData mediaQuery) {
  return mediaQuery.size.height;
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

