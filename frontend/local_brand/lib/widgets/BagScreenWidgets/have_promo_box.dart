import 'package:flutter/material.dart';
import 'package:local_brand/screens/shop_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class HavePromoBox extends StatelessWidget {
  const HavePromoBox({Key? key,required this.onPressed,required this.mainIcon,required this.title,  this.icon}) : super(key: key);
  final title;
  final icon;
  final mainIcon;
  final  onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8*10,
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(width: 1, color: Color(0xFFE4E4E4)),
          bottom: BorderSide(color: Color(0xFFE4E4E4)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(child: icon != null ? Icon(icon):null)
          ,SizedBox(width: 8,),
          Expanded(
            child: SizedBox(
              child:TextW400F16(text: title, link: false, color: Colors.black),
            ),
          ),
          IconButton(onPressed: onPressed, icon: Icon(mainIcon)),
        ],
      ),
    );
  }
}
