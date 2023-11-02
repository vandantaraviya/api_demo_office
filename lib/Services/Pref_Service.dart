import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class PrefService {
  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setvalue(String key, dynamic value) async {
    if (value is String) {
      await _pref!.setString(key, value);
    } else if (value is double) {
      await _pref!.setDouble(key, value);
    } else if (value is bool) {
      await _pref!.setBool(key, value);
    } else if (value is List<String>) {
      await _pref!.setStringList(key, value);
    } else {
      Get.snackbar(
        'Preference ERROR',
        'Send Valid value for Store Data in Preferences',
      );
    }
  }

  static String getString(String key) {
    return _pref!.getString(key) ?? '';
  }

  static int getint(String key) {
    return _pref!.getInt(key) ?? 0;
  }

  static double getDouble(String key) {
    return _pref!.getDouble(key) ?? 0;
  }

  static bool getBool(String key) {
    return _pref!.getBool(key) ?? false;
  }

  static List<String> getList(String key) {
    return _pref!.getStringList(key) ?? [];
  }

}
