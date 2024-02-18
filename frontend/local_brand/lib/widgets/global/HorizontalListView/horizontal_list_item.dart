import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/providers/product_image_provider.dart';
import 'package:local_brand/screens/product_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class HorizontalListItem extends ConsumerWidget {
  const HorizontalListItem({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context,ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: (){ref.read(productImageProvider.notifier).addImage(product.images[0]); Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => ProductScreen(product: product,), // Replace with your widget
          ));},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8*24,
                height: 8*24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 8*20,
                child: TextW500F16(text: product.title, link: false,color: Colors.black)
              ),
              const SizedBox(height: 8), TextW500F16(text: product.price.toString() + ' EGP', link: false,color: Color(0xFF767676),)

            ],
          ),
        ),
      ),
    );
  }
}
