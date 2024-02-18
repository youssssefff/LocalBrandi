import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f32.dart';

class SecondAppBar extends StatelessWidget {
  SecondAppBar({Key? key,required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(left: 24.0,top: 24),
    alignment: Alignment.centerLeft,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: TextW500F32(text:title ),
    );
  }
}
