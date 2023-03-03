import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _localStorageService =
      LocalStorageService._internal();

  factory LocalStorageService() {
    return _localStorageService;
  }

  LocalStorageService._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  bool isExistKey(String key) {
    return _prefs.containsKey(key);
  }
}
