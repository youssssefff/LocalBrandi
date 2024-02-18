import 'package:flutter/material.dart';
import 'package:local_brand/screens/shop_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class SecondDropDownBox extends StatelessWidget {
  const SecondDropDownBox({Key? key,required this.title,required this.onPressedFunction}) : super(key: key);
  final title;
  final onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8*12,
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(width: 1, color: Color(0xFFE4E4E4)),
          bottom: BorderSide(color: Color(0xFFE4E4E4)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 24,)
      ,SizedBox(width: 8,),
          Expanded(
            child: SizedBox(
              child: TextW400F16(text: title, link: false, color: Colors.black)
            ),
          ),
          IconButton(onPressed: onPressedFunction, icon: Icon(Icons.keyboard_arrow_down)),
          SizedBox(width: 24,),
        ],
      ),
    );
  }
}
