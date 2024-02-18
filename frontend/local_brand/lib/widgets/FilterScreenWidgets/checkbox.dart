import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class SortByCheckbox extends StatefulWidget {
  const SortByCheckbox({Key? key, required this.options, required this.onChanged}) : super(key: key);
  final List<String> options;
  final onChanged;

  @override
  _SortByCheckboxState createState() => _SortByCheckboxState();
}

class _SortByCheckboxState extends State<SortByCheckbox> {
  List<String?> selectedValues = [];

  void onCheckboxChanged(String value) {
    setState(() {
      if (selectedValues.contains(value)) {
        selectedValues.remove(value);
      } else {
        selectedValues.add(value);
      }
    });
    widget.onChanged(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final option = widget.options[index];
              return CheckboxListTile(
                title: TextW500F16(text: widget.options[index],color: Colors.black,link: false,),
                value: selectedValues.contains(option),
                onChanged: (value) => onCheckboxChanged(option),
              );
            },
          ),
        ],
      ),
    );
  }
}
