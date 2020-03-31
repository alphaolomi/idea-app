import 'package:flutter/material.dart';


// ignore: must_be_immutable
class IdeaDetailScreen extends StatelessWidget {
//  const Idea _idea;
//  const IdeaDetailScreen({Key key, this._idea}) : super(key: key);
  const IdeaDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      );
  }
}