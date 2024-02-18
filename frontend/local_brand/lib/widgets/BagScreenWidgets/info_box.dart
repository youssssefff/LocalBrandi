import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/providers/BagProvider.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart'; // Import your BagProvider

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {
      // Use ref.watch to listen to changes in BagProvider
      int totalBagPrice = ref.watch(BagProvider.notifier).getTotalBagPrice();

      return Container(
      margin: EdgeInsets.symmetric(vertical:8 ),
      width: 327,
      padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextW400F16(text: 'Subtotal', link: false, color: Color(0xFF767676)),
                const SizedBox(width: 66),TextW400F16(text: '$totalBagPrice EGP', link: false, color: Color(0xFF767676))
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextW400F16(text: 'Delivery', link: false, color: Color(0xFF767676))
               ,
                const SizedBox(width: 66),
                TextW400F16(text: 'Standard - Free', link: false, color: Color(0xFF767676))
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextW500F16(text: 'Estimated Total', link: false, color: Colors.black)
                ,
                const SizedBox(width: 66),
                TextW500F16(text: '$totalBagPrice EGP + Tax', link: false, color: Colors.black)
                ,
              ],
            ),
          ),
        ],
      ),
    );
    });
}}
