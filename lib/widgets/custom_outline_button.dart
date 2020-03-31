import 'package:flutter/material.dart';
import 'package:ideaapp/theme/color.dart';

/// CustomOutlineButton
/// @param onPressed
/// @param text
/// @param highlightcolor
/// @param borderColor
/// @param textStyle
/// @param padding
// ignore: must_be_immutable
class CustomOutlineButton extends StatelessWidget{

  GestureTapCallback onPressed;
  String text;
  Color highlightColor;
  Color borderColor;
  TextStyle textStyle = TextStyle();
  EdgeInsets padding;
  CustomOutlineButton({this.onPressed,this.text,this.highlightColor,this.borderColor,this.textStyle,this.padding});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      child: Text(text,style: textStyle,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      padding: padding,
      textColor: primaryColor,
      highlightedBorderColor: primaryColor,
      borderSide: BorderSide(color: borderColor)
    );
  }
}