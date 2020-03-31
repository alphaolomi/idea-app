import 'package:flutter/material.dart';
import 'package:ideaapp/models/idea.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AddIdeaScreen extends StatefulWidget {
  @override
  _AddIdeaScreenState createState() => _AddIdeaScreenState();
}

class _AddIdeaScreenState extends State<AddIdeaScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                  Text(
                    'Please fill in all details',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: ideaTitleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Idea title",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Idea Descrption",
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked;
                    }),
                    title: Text('Complete?'),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add Idea',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
//                      if (_formKey.currentState.validate()) {
//                        Scaffold.of(context).showSnackBar(
//                            SnackBar(content: Text('Processing Data')));
                        onAdd();
//                      } else {
//                        Scaffold.of(context).showSnackBar(SnackBar(
//                            content: Text('Fill all required fields')));
//                      }
                    },
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
