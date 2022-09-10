import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'Helper/Localization/localization.dart';
import 'app/routes/app_pages.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, /*SfGlobalLocalizations.delegate,*/ GlobalCupertinoLocalizations.delegate],
        supportedLocales: [
          const Locale('en'),
          const Locale('de'),
        ],
        translations: AppLocalization(),
        fallbackLocale: Locale('en'),
        gdfgd
        // locale: Locale('pt_BR', 'en_US'),
        ),
  );
}
