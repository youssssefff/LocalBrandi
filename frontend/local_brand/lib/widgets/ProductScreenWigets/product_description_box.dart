import 'package:flutter/material.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f24.dart';

class ProductDescriptionBox extends StatelessWidget {
  const ProductDescriptionBox({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            //height: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextW400F16(
                  text: product.category,
                  link: false,
                  color: Colors.black,
                ),
                TextW500F24(text: product.title),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextW500F16(
            text: '${product.price}' + ' EGP',
            link: false,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          TextW400F16(
              text: product.description, link: false, color: Colors.black),
          const SizedBox(height: 16),
          TextW400F16(
              text: '-Color: ${product.color}\n-Style: ${product.style}',
              link: false,
              color: Colors.black)
          //const SizedBox(height: 16),
        ],
      ),
    );
  }
}
