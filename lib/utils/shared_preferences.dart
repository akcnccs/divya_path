import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil? _instance;
  static SharedPreferences? _prefs;

  static Future<SpUtil> getInstance() async {
    if (_instance == null) {
      _instance = SpUtil._();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  SpUtil._();
}
