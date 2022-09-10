import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Pages/Profile/Setting/SettingController.dart';

class CommonVariables {
  final BuildContext context;
  CommonVariables({this.context});

  bool validationEmail({input}) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input)) {
      return true;
    }
    return false;
  }

  bool checkPasswordnewPass({input}) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(input))
      return true;
    else
      return false;
  }

  Future<String> getId() async {
    if (Platform.isIOS == true) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

