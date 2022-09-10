import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Helper/NotificatiokKeys.dart';
import '../../../../Helper/preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    an();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void getSelectedLanguage() async {
    var selectedLanguage1 = await Preferences.preferences.getString(key: PrefernceKey.savelanguageKey);
    if (selectedLanguage1 == null) {
      Get.updateLocale(Locale("en"));
      Preferences.preferences.saveString(key: PrefernceKey.savelanguageKey, value: "en");
    } else {
      Get.updateLocale(Locale(selectedLanguage1));
    }
  }

  var selectedLanguage = "".obs;
  void updateLocal() {
    Preferences.preferences.saveString(key: PrefernceKey.savelanguageKey, value: selectedLanguage.value);
    Get.updateLocale(Locale(selectedLanguage.value));
  }

  void getSelectedLanguage1() async {
    selectedLanguage.value = (await Preferences.preferences.getString(key: PrefernceKey.savelanguageKey))!;
  }

  void an() async {
    getSelectedLanguage();
    getSelectedLanguage1();
  }
}
