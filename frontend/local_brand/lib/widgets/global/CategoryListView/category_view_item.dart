import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class CategoryViewItem extends StatelessWidget {
  const CategoryViewItem({Key? key,required this.categoryTitle,required this.selected}) : super(key: key);
  final categoryTitle;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: null,
      height: 8*6,
      padding: const EdgeInsets.symmetric(horizontal: 24,),
      decoration: selected ? BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black ,
            width: 2,
          ),
        ),
      ) : null,
     child: Center(
        child: TextW400F16(text: categoryTitle, link: false, color: selected ? Colors.black : Color(0xFF767676))
      ),
    );
  }
}
