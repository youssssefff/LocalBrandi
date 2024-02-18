import 'package:flutter/material.dart';

class TextW500F24 extends StatelessWidget {
  const TextW500F24({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.17,
      ),
    );
  }
}
