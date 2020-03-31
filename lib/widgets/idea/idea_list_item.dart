import 'package:flutter/material.dart';
import 'package:ideaapp/models/idea.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:provider/provider.dart';

class IdeaListItem extends StatelessWidget {
  final Idea idea;

  IdeaListItem({@required this.idea});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: idea.completed,
        onChanged: (bool checked) {
          Provider.of<IdeaModel>(context, listen: false).toggleIdea(idea);
        },
      ),
      title: Text(idea.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<IdeaModel>(context, listen: false).deleteIdea(idea);
        },
      ),
    );
  }
}
