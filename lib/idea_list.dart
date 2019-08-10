import 'package:flutter/material.dart';
import 'package:idea_app/idea_card.dart';
import 'package:idea_app/idea_model.dart';

class IdeaList extends StatelessWidget {
  final List<Idea> dog_list;

  IdeaList(this.dog_list);

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: dog_list.length,
      itemBuilder: (context, int) {
        return new IdeaCard(dog_list[int]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}
