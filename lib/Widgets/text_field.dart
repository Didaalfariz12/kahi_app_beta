import 'package:flutter/material.dart';

Widget CustomTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int? maxLines = 1,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hint,
              border: UnderlineInputBorder(),
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
        ),
      )
    ],
  );
}
