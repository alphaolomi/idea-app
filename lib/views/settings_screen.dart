import 'package:flutter/material.dart';
import 'package:ideaapp/views/about.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Theme',
            tiles: [
              SettingsTile.switchTile(
                title: 'Dark Mode',
                leading: Icon(Icons.color_lens),
                switchValue: isDark,
                onToggle: (bool value) {
                  isDark = value;
                },
              )
            ],
          ),
          SettingsSection(
            title: 'Help',
            tiles: [
              SettingsTile(
                title: 'Project repository',
                subtitle: 'Open in Github',
                leading: Icon(Icons.description),
                onTap: _openGitHub
              ),
              SettingsTile(
                title: 'About',
                subtitle: 'English',
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  void _openGitHub() {
    launch('https://www.github.com/alphaolomi/idea-app');
  }
}

