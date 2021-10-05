import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/routes/app_pages.dart';
import 'package:flutterui_web/theme/app_theme.dart';
import 'package:flutterui_web/translations/app_translations.dart';
import 'package:flutterui_web/pages/unknown/view/view.dart' as unknown;

import 'translations/localization_service.dart';

void main() async {
  await GetStorage
      .init(); // before building the app  you need to initialize GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    appdata.writeIfNull('langPosition', 0);

    return SimpleBuilder(builder: (_) {
      bool isDarkMode = appdata.read('darkmode');
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode ? appThemeDataDark : appThemeDataLight,
        initialRoute: Routes.main,
        locale: LocalizationService.locales[appdata.read('langPosition') ?? 0],
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        translationsKeys: AppTranslation.translations,
        getPages: AppPages.pages,
        unknownRoute: GetPage(name: '/unknown', page: () => unknown.View()),
      );
    });
  }
}
