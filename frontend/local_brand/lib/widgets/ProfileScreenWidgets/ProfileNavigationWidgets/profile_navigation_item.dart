import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class ProfileNavigationItem extends StatelessWidget {
  const ProfileNavigationItem({Key? key,required this.icon,required this.title}) : super(key: key);
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8*12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          TextW400F16(text: title, link: false, color: Colors.grey)
        ],
      ),
    );
  }
}
