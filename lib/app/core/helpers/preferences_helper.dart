import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _preferences!.getString(key);
  }

  List<String> getStringList(String key) {
    return _preferences!.getStringList(key) ?? [];
  }

  Future<bool> setString(String key, String value) {
    return _preferences!.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _preferences!.setStringList(key, value);
  }

  Future<bool> remove(String key) {
    return _preferences!.remove(key);
  }
}
