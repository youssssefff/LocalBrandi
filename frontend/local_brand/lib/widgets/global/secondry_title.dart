import 'dart:ffi';

import 'package:flutter/material.dart';

class SecondryTitle extends StatelessWidget {
  SecondryTitle({Key? key,required this.text,required this.link}) : super(key: key);
  String text;
  bool link;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(

        color: link == true ? Colors.black:Color(0xFF767676),
        fontSize: 16,
        fontFamily: 'Helvetica Now Text ',
        fontWeight: FontWeight.w400,
        letterSpacing: -0.40,
          decoration: link == true ? TextDecoration.underline : null
      ),
    );
  }
}
