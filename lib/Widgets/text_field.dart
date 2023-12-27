import 'package:flutter/material.dart';

Widget CustomTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int? maxLines = 1,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              color: Color(0xff484848),
            ),
            children: [
              TextSpan(
                text: title!,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Color(0xff484848),
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color:  Color(0xffcd3434),
                ),
              ),
            ],
          ),
        ),
      ),
      // TextField
      Container(
        padding: const EdgeInsets.only(bottom: 10),
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
