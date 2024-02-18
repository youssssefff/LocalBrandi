import 'package:flutter/material.dart';
import 'package:local_brand/widgets/global/SizeModal/size_modal_option.dart';

class SizeModal extends StatelessWidget {
  SizeModal({Key? key}) : super(key: key);
  String currentSize = "M";
  void changeSize(String size){
    currentSize = size;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 532,
      padding: const EdgeInsets.only(top: 6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    'Select size',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Helvetica Now Text ',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 14,
                  height: 14,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),

                ),
              ],
            ),
          ),SizeModalOption(size: "S",changeSize: changeSize),
          SizeModalOption(size: "M",changeSize: changeSize),
          SizeModalOption(size: "L",changeSize: changeSize),
        ],
      ),
    );
  }
}