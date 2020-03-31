import 'package:flutter/material.dart';
import 'package:ideaapp/models/idea.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:provider/provider.dart';

class AddIdeaScreen extends StatefulWidget {
  @override
  _AddIdeaScreenState createState() => _AddIdeaScreenState();
}

class _AddIdeaScreenState extends State<AddIdeaScreen> {
  final ideaTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    ideaTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = ideaTitleController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final Idea idea = Idea(
        title: textVal,
        completed: completed,
      );
      Provider.of<IdeaModel>(context, listen: false).addIdea(idea);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Idea'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: ideaTitleController),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                          completedStatus = checked;
                        }),
                    title: Text('Complete?'),
                  ),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
