import 'package:flutter/material.dart';

/// LoaderWidget
Widget loaderWidget() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        strokeWidth: 3.0,
      ),
    ),
    color: Colors.white54,
  );
}
