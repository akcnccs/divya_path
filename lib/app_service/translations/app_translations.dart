import 'package:get/get.dart';

class AppTranslations extends Translations {
  static final AppTranslations instance = AppTranslations._();
  AppTranslations._();

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'appName': 'Divya Path',
    },
  };

  void loadSavedLocale() {
    // Mock
  }
}
