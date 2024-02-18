import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/providers/product_image_provider.dart';

class ProductListViewItem extends ConsumerWidget {
  const ProductListViewItem({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      onTap: (){
        ref.read(productImageProvider.notifier).addImage(url);
      },
      child: Container(
        width: 8*20,
        height: 8*20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
