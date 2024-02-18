import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/providers/product_image_provider.dart';

class ProductMainImage extends ConsumerWidget {
  const ProductMainImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      width: double.infinity,
      height: 8*60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ref.watch(productImageProvider)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
