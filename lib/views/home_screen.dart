import 'package:flutter/material.dart';
import 'package:ideaapp/providers/idea_model.dart';
import 'package:ideaapp/widgets/idea_list.dart';
import 'package:provider/provider.dart';

import 'add_idea_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Ideas'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddIdeaScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Consumer<IdeaModel>(
          builder: (context, ideas, child) => IdeaList(
            ideas: ideas.allIdeas,
          ),
        ),
      ),
    );
  }
}
