import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  BigButton({Key? key,required this.onPressedFunction,this.icon,required this.title,required this.color, required this.textColor}) : super(key: key);
  final color;
  final textColor;
  final title;
  final icon;
  final onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: onPressedFunction,
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: 'Helvetica Now Text ',
                    fontWeight: FontWeight.w500,
                  ),
                )),

          ],
        ),
        width: MediaQuery.sizeOf(context).width,
        height: 8*7,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ));
  }
}