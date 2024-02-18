import 'package:flutter/material.dart';

class TextW400F16 extends StatelessWidget {
  const TextW400F16({Key? key,required this.text,required this.link,required this.color}) : super(key: key);
  final String text;
  final bool link;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.40,
          decoration: link == true ? TextDecoration.underline : null
      ),
    );
  }
}
