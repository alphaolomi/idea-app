import 'package:flutter/material.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:ideaapp/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => IdeaModel(),
      child: MaterialApp(
        title: 'Ideally',
        theme: ThemeData.light(),
        home: HomeScreen(),
      ),
    );
  }
}
