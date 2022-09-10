import 'package:get/get.dart';

import '../main.dart';

class RouterForApp {
  static final route = [
    GetPage(
      name: '/dashboard',
      page: () => MyHomePage(),
    ),
  ];
}
