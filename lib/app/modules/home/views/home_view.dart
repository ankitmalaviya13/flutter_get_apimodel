import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('locale'.tr),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            content: Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      'letsChangeYourLanguge'.tr,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        homeController.selectedLanguage.value = "en";
                      },
                      child: Obx(() => Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(color: homeController.selectedLanguage.value == "en" ? Colors.green : Colors.red, borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  // Image.asset(
                                  //   AssestPath.setting + "united-states.png",
                                  //   height: 28,
                                  // ),
                                  SizedBox(width: 10),
                                  Text(
                                    'en_US'.tr,
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    InkWell(
                        onTap: () {
                          homeController.selectedLanguage.value = "de";
                        },
                        child: Obx(
                          () => Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(color: homeController.selectedLanguage.value == "de" ? Colors.green : Colors.red, borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    'de'.tr,
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        homeController.updateLocal();
                        Get.back();
                      },
                      child: Container(
                        height: 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF101928),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                              child: Text(
                            'updatelanguge'.tr,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: 'language'.tr,
            titleStyle: TextStyle(
              fontSize: 25,
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
