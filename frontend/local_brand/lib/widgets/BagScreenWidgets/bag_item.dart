import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/ordered_product.dart';
import 'package:local_brand/providers/BagProvider.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class BagItem extends ConsumerWidget {
  BagItem({Key? key, required this.orderedProduct,}) : super(key: key);
  final OrderedProduct orderedProduct;
  int quantity =1;
  int price = 0;
  @override
  Widget build(BuildContext context, ref) {
    int quantity = ref.read(BagProvider.notifier).getQuantity(orderedProduct);
    int price = ref.read(BagProvider.notifier).getTotalPrice(orderedProduct);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8 * 20,
                height: 8 * 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(orderedProduct.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                width: 8 * 21,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextW500F16(text: '${orderedProduct.product.title}', link: false, color: Colors.black),
                    TextW400F16(text: '${orderedProduct.product.color} ${orderedProduct.product.category}\nSize ${orderedProduct.size}', link: false, color: Color(0xFF767676)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TextW500F16(text: 'Qty $quantity', link: false, color: Colors.black),
                  Container(width: 8*4,
                    child: IconButton(
                        onPressed: () {
                          quantity = ref.read(BagProvider.notifier).decreaseQuantity(orderedProduct,1);
                          },
                        icon: Icon(Icons.remove)),
                  ),
                  Container(width: 8*2,
                    child: IconButton(
                        onPressed: () {
                         ref.read(BagProvider.notifier).addProductToBag(orderedProduct);
                          },
                        icon: Icon(Icons.add)),
                  ),
                ],
              ),
              TextW500F16(text: '$price EGP', link: false, color: Colors.black),
            ],
          )
        ],
      ),
    );
  }
}
