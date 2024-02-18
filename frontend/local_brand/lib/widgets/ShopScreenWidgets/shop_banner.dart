import 'package:flutter/material.dart';

class ShopBanner extends StatelessWidget {
  const ShopBanner({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 8*26,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(title),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
