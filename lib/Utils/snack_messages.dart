import 'package:flutter/material.dart';
import 'package:ekahi/Styles/colors.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: Colors.blueGrey),
      ),
      backgroundColor: Colors.white,
    ),
  );
}
