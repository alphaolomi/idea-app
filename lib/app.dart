import 'package:flutter/material.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:ideaapp/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'theme/main.dart';

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ideally',
        theme: appThemeLight,
        home: HomeScreen(),
      ),
      create: (BuildContext context) {
        return IdeaModel();
      },

    );
  }
}