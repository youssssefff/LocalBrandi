import 'package:flutter/material.dart';

class TextW400F24 extends StatelessWidget {
  const TextW400F24({Key? key,required this.text,required this.color,required this.link}) : super(key: key);
  final String text;
  final Color color;
  final bool link;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.70,
      ),
    );
  }
}
