import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class SizeModalOption extends StatelessWidget {
  const SizeModalOption({Key? key,required this.size,required this.changeSize}) : super(key: key);
  final size;
  final Function changeSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){changeSize(size);},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFE4E4E4),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Center(
          child: TextW500F16(text: size,link: false,color:Colors.black ,)
        ),
      ),
    );
  }
}
