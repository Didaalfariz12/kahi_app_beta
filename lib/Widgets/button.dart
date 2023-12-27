import 'package:flutter/material.dart';

Widget CustomButton({
  VoidCallback? tap,
  bool? status = false,
  String? text = 'save',
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false ? Color(0xff1b4965) : Colors.white,
          borderRadius: BorderRadius.circular(40)),
      width: MediaQuery.of(context!).size.width,
      child: Text(
        status == false ? text! : 'Please wait...',
        style: TextStyle(
            color: status == false ? Colors.white : Color(0xff1b4965),
            fontSize: 18),
      ),
    ),
  );
}
