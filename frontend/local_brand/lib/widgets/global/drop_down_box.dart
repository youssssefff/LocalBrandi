import 'package:flutter/material.dart';
import 'package:local_brand/screens/shop_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class DropDownBox extends StatelessWidget {
  const DropDownBox({Key? key,required this.mainIcon,required this.category,  this.icon,required this.gender}) : super(key: key);
  final category;
  final gender;
  final icon;
  final mainIcon;
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
        children: [SizedBox(width: 24,),
        Container(child: icon != null ? Icon(icon,size:16):null)
      ,SizedBox(width: 8*2,),
          Expanded(
            child: SizedBox(
              child: TextW400F16(text: category, link: false, color: Colors.black)
            ),
          ),
          IconButton(onPressed: (){
            print(category);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopScreen(title:category,category:category,gender:gender ,), // Replace with your widget
              )
          );}, icon: Icon(mainIcon)),SizedBox(width: 24,),
        ],
      ),
    );
  }
}
