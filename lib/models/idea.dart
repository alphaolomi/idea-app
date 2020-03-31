import 'package:flutter/material.dart';

class Idea {
  String title;
  bool completed;

  Idea({@required this.title, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
