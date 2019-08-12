import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idea_app/idea_list.dart';
import 'package:idea_app/idea_model.dart';
import 'package:idea_app/new_idea_form.dart';
import 'package:idea_app/util/const.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  @override

  bool isDark = false;

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: isDark ? Constants.darkTheme : Constants.lightTheme,
        home: HomePage(),
        );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var initialIdeas = <Idea>[]
    ..add(new Idea('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Idea('Rex', 'Seattle, WA, USA', 'A Very Good Boy'))
    ..add(new Idea('Rod Stewart', 'Prague, CZ', 'A Very Good Boy'))
    ..add(new Idea('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(new Idea('Buddy', 'North Pole, Earth', 'A Very Good Boy'));

  Future<Null> _showNewDogForm() async {
    Idea newDog = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new AddDogFormPage();
        },
      ),
    );
    if (newDog != null) {
      initialIdeas.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text(widget.title),
        actions: [
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => _showNewDogForm(),
          ),
        ],
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: new Center(
          child: new IdeaList(initialIdeas),
        ),
      ),
    );
  }
}
