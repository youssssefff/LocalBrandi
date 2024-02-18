import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class SortByRadio extends StatefulWidget {
  const SortByRadio({Key? key,required this.onChanged}) : super(key: key);
  final onChanged;

  @override
  _SortByRadioState createState() => _SortByRadioState();
}

class _SortByRadioState extends State<SortByRadio> {
  String selectedValue = 'Newest';
  void onRadioChanged(String? value) {
    setState(() {
      selectedValue = value!;
    });
    widget.onChanged(selectedValue);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextW500F16(text: "Sort By",color: Colors.black,link: false,),
          ListTile(
            title: Text('Newest'),
            leading: Radio(
              value: 'Newest',
              groupValue: selectedValue,
              onChanged: onRadioChanged,
            ),
          ),
          ListTile(
            title:TextW500F16(text: 'Price: Low-High',color: Colors.black,link: false,) ,
            leading: Radio(
              value: 'Price: Low-High',
              groupValue: selectedValue,
              onChanged: onRadioChanged,
            ),
          ),
          ListTile(
            title: TextW500F16(text: 'Price: High-Low',color: Colors.black,link: false,),
            leading: Radio(
              value: 'Price: High-Low',
              groupValue: selectedValue,
              onChanged: onRadioChanged,
            ),
          ),
        ],
      ),
    );
  }
}
