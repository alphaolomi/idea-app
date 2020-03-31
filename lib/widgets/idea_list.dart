import 'package:flutter/material.dart';
import 'package:ideaapp/models/idea.dart';
import 'package:ideaapp/widgets/idea_list_item.dart';

class IdeaList extends StatelessWidget {
  final List<Idea> ideas;

  IdeaList({@required this.ideas});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenIdeas(),
    );
  }

  List<Widget> getChildrenIdeas() {
    return ideas.map((i) => IdeaListItem(idea: i)).toList();
  }
}
