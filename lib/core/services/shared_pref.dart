import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }
  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();
  static late SharedPreferences sharedPreferences;
  //initilaized shared preferences instance
  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences getPreferencesInstance() {
    return sharedPreferences;
  }

  // Set and GEt String
  Future<dynamic> setString(String key, String stringvalue) async {
    await sharedPreferences.setString(key, stringvalue);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

// Set And Get Boolean
  Future<dynamic> setBoolean(String key, bool boolValue) async {
    await sharedPreferences.setBool(key, boolValue);
  }

  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  // Set And Get Double
  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  // Set And Get Integer
  Future<dynamic> setInteger(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  int? getInteger(String key) {
    return sharedPreferences.getInt(key);
  }

  // remove Shared preference
  Future<dynamic> removeSharedPref(String key) async {
    await sharedPreferences.remove(key);
  }

// if ican recivice from Preferance
  bool containPref(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

// Clear all data in Preferences
  Future<dynamic> clearSharedPref() async {
    await sharedPreferences.clear();
  }
}
