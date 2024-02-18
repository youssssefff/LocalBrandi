import 'package:flutter/material.dart';

class WhatNew extends StatelessWidget {
  const WhatNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'What’s new',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Helvetica Now Text ',
        fontWeight: FontWeight.w500,
        letterSpacing: -0.40,
      ),
    );
  }
}
