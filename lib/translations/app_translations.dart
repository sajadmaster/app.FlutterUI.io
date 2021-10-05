import 'fa_IR/fa_ir_translations.dart';
import 'en_US/en_us_translations.dart';
abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'fa_IR': faIR,
    'en_US': enUS,
  };
}
