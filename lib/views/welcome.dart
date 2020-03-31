import 'package:flutter/material.dart';
import 'package:ideaapp/providers/auth_provider.dart';
import 'package:ideaapp/providers/idea_model.dart';

import 'package:ideaapp/theme/color.dart';
import 'package:ideaapp/views/auth/landing_screen.dart';
import 'package:ideaapp/widgets/idea/idea_list.dart';
import 'package:provider/provider.dart';

import 'add_idea_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  logout(BuildContext context) {
    try {
      Provider.of<AuthDataProvider>(context, listen: false).logoutUser();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Ideas'),
      ),
      drawer: drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add Idea',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddIdeaScreen(),
            ),
          );
        },
      ),
      body: Container(
        child: Consumer<IdeaModel>(
          builder: (context, ideas, child) => (ideas.allIdeas.length == 0)
              ? Center(
                  child: Text('No any at the moment '),
                )
              : IdeaList(ideas: ideas.allIdeas),
        ),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Ideally",
                style: TextStyle(color: primaryColor, fontSize: 30.0),
              ),
            ),
            drawerMenu(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  todo add user name here
                  Text(
                    "Barcelona, Spain",
                    style: TextStyle(fontSize: titleText, color: secondryColor),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Change",
                    style: TextStyle(color: primaryColor, fontSize: normalText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerMenu() {
    return Column(
      children: <Widget>[
        drawerList(active: true, icon: Icons.home, name: "Home", id: "HOME"),
        drawerList(
            active: false,
            icon: Icons.bookmark_border,
            name: "My Ideas",
            id: "MY_IDEAS"),
        drawerList(
            active: false,
            icon: Icons.settings,
            name: "Settings",
            id: "SETTING"),
        drawerList(
            active: false,
            icon: Icons.power_settings_new,
            name: "Log Out",
            id: "LOGOUT"),
      ],
    );
  }

  Widget drawerList(
      {String name, IconData icon, bool active, String id, void action}) {
    return InkWell(
      onTap: () {
        if (id == "LOGOUT") {
          logout(_scaffoldKey.currentContext);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: active ? primaryColor : secondryColor,
              size: titleText,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              name,
              style: TextStyle(
                  color: active ? primaryColor : secondryColor,
                  fontSize: titleText),
            )
          ],
        ),
      ),
    );
  }
}
