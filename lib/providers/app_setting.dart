import 'package:flutter/material.dart';
import 'package:ideaapp/shared/shared_pref.dart';

class SettingDataProvider with ChangeNotifier {
  bool _isDark = false;
  SharedPref _sharedPref = SharedPref();
  bool get isDark => _isDark;

  void changeTheme() {
    _isDark = !_isDark;
    _sharedPref.save('isDark', _isDark);
    notifyListeners();
  }
}
