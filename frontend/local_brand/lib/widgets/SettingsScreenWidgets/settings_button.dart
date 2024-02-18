import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8*8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        border: Border(
       bottom: BorderSide(strokeAlign: BorderSide.strokeAlignOutside, color: Color(0xFFE4E4E4), width: 1),)),
      child: TextW400F16(text: 'Units of Measure', link: false, color: Colors.black),
    );
  }
}
