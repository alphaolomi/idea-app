import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ideaapp/theme/color.dart';
import 'package:ideaapp/widgets/custom_button.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.lightbulb,size: 160,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  ("Ideally").toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ));
                  },
                  text: "Sign Up",
                  color: primaryColor,
                  width: 250.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  text: "Log In",
                  color: Colors.black,
                  width: 250.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
