import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ideaapp/models/idea.dart';

class IdeaModel extends ChangeNotifier {
  final List<Idea> _ideas = [];

  UnmodifiableListView<Idea> get allIdeas => UnmodifiableListView(_ideas);

  UnmodifiableListView<Idea> get incompleteIdeas =>
      UnmodifiableListView(_ideas.where((todo) => !todo.completed));

  UnmodifiableListView<Idea> get completedIdeas =>
      UnmodifiableListView(_ideas.where((todo) => todo.completed));

  void addIdea(Idea idea) {
    _ideas.add(idea);
    notifyListeners();
  }

  void toggleIdea(Idea idea) {
    final ideaIndex = _ideas.indexOf(idea);
    _ideas[ideaIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteIdea(Idea idea) {
    _ideas.remove(idea);
    notifyListeners();
  }
}
