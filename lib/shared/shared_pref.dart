import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// SharedPref
class SharedPref {
  /// read
  /// @param key String
  read(String key) async {
    final pref = await SharedPreferences.getInstance();
    return json.decode(pref.getString(key));
  }

  /// save
  /// @param key String
  save(String key, value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, json.encode(value));
  }

  /// remove
  /// @param key String
  remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}
