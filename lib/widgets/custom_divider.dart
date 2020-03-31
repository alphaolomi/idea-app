import 'package:flutter/material.dart';

Color color = Colors.grey[200];

/// CustomDivider
///
// ignore: must_be_immutable
class CustomDivider extends StatelessWidget {
  double height;
  Color color;

  CustomDivider({this.height = 1.0, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
          ),
        ),
      ),
    );
  }
}
