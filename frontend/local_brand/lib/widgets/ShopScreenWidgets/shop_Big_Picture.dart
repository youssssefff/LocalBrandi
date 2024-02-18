import 'package:flutter/material.dart';

class ShopBigPicture extends StatelessWidget {
  const ShopBigPicture({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 8*52,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(title),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
