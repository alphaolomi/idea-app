import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  read(String key) async {
    final pref = await SharedPreferences.getInstance();
    return json.decode(pref.getString(key));
  }

  save(String key, value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, json.encode(value));
  }

  remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}