import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/providers/BagProvider.dart';
import 'package:local_brand/widgets/BagScreenWidgets/bag_item.dart';
import 'package:local_brand/widgets/BagScreenWidgets/delivery_box.dart';
import 'package:local_brand/widgets/BagScreenWidgets/have_promo_box.dart';
import 'package:local_brand/widgets/BagScreenWidgets/info_box.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';
class BagScreen extends ConsumerWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    void _showPromoCodeModal() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextW500F16(text: 'Enter Promo Code', link: false, color: Colors.black),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Promo Code',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle applying the promo code logic here
                    Navigator.pop(context); // Close the modal
                  },
                  child: Text('Apply'),
                ),
              ],
            ),
          );
        },
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
        Container(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ref.watch(BagProvider).length,
          itemBuilder: (context, index) {
            return BagItem(orderedProduct: ref.watch(BagProvider)[index]);
          },
        ),
      ),
          SizedBox(height: 8),
          DeliveryBox(),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: HavePromoBox(
              mainIcon: Icons.add,
              icon: null,
              title: "have a promo code?",
              onPressed:_showPromoCodeModal ,
            ),
          ),
          InfoBox(),
          BigButton(
            color: Colors.black,
            textColor: Colors.white,
            title: "checkout",
            onPressedFunction: () {},
          ),
        ],
      ),
    );
  }
}
