import 'package:flutter/material.dart';
import 'package:ideaapp/providers/app_setting.dart';
import 'package:ideaapp/providers/auth_provider.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:ideaapp/views/auth/landing_screen.dart';
import 'package:ideaapp/views/home_screen.dart';
import 'package:ideaapp/views/welcome.dart';
import 'package:provider/provider.dart';
import 'theme/main.dart';

class TodosApp extends StatefulWidget {
  @override
  _TodosApp createState() => _TodosApp();
}

class _TodosApp extends State<TodosApp> {
  AuthDataProvider _dataProvider = AuthDataProvider();
  SettingDataProvider _settingDataProvider = SettingDataProvider();
  bool _isAuthenticated = false;
  bool _isDark;

  @override
  void initState() {
    super.initState();
    updateThemeFromSharedPref();
    _dataProvider.autoAuthenticate().then((status) {
      print('status' + status.toString());
      setState(() {
        _isAuthenticated = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ideally',
        theme: _isDark ? appThemeDark : appThemeLight,
        home: _isAuthenticated ? WelcomeScreen() : LandingScreen(),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => SettingDataProvider()),
        ChangeNotifierProvider(create: (_) => IdeaModel()),
        ChangeNotifierProvider(create: (_) => AuthDataProvider()),
      ],
    );
  }

  ThemeData _buildTheme() {
    bool isDark = Provider.of<SettingDataProvider>(context).isDark;
    return isDark ? appThemeDark : appThemeLight;
  }

  void updateThemeFromSharedPref() {
    setState(() {
      _isDark = _settingDataProvider.isDark;
    });
  }
}
