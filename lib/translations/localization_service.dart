import 'dart:ui';

import 'package:get/get.dart';
import 'fa_IR/fa_ir_translations.dart';
import 'en_US/en_us_translations.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Get.deviceLocale;

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'فارسی',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('fa', 'IR'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS, // lang/en_us.dart
    'fa_IR': faIR, // lang/fa_ir.dart
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale ?? const Locale('en_US');
  }
}
