import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Text(
              'IdeaApp',
              style: TextStyle(
                color: Colors.black,
                fontSize: 45.0,
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            width: 160.0,
            height: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              'Version',
              style: TextStyle(
                color: Colors.grey,
                height: 1.4,
                fontSize: 15.0,
              ),
            ),
          ),
          Text(
            '1.00.01',
            style: TextStyle(
              color: Colors.black,
              height: 1.4,
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              'Last Update',
              style: TextStyle(
                color: Colors.grey,
                height: 1.4,
                fontSize: 15.0,
              ),
            ),
          ),
          Text(
            'January 2020',
            style: TextStyle(
              color: Colors.black,
              height: 1.4,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white,
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }
}
