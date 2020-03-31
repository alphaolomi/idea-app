import 'package:flutter/material.dart';

/// CustomButton
///  @param text   - string datatype  : Button text anme
///  @param color  - Color class      : Button Color
///  @param width  - double datatype  : Button width   ( default full width )
// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  Color color;
  GestureTapCallback onPressed;
  double width;

  CustomButton({
    @required this.text,
    @required this.color,
    this.width,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      padding: EdgeInsets.all(0.0),
      onPressed: onPressed,
      child: Container(
        width: (width != null ? width : double.infinity),
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Text(
          (text).toUpperCase(),
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            letterSpacing: 0.0,
          ),
        ),
      ),
    );
  }
}
