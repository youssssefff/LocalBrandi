import 'package:flutter/material.dart';

class TextW500F16 extends StatelessWidget {
  const TextW500F16({Key? key,required this.text,required this.link,required this.color}) : super(key: key);
  final String text;
  final bool link;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: link == true ? TextDecoration.underline : null,
        overflow: TextOverflow.ellipsis
      ),
    );
  }
}
