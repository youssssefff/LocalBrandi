import 'package:flutter/material.dart';

class FirstAppBar extends StatelessWidget {
  const FirstAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [IconButton(
        icon: Icon(Icons.filter_alt_outlined),
        onPressed: () {
          // Perform search action
        },
      ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Perform search action
          },
        )],
      title: Text(
        "title",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Helvetica Now Text ',
          fontWeight: FontWeight.w500,
          height: 0.06,
          letterSpacing: -0.40,
        ),
      ),);
  }
}
