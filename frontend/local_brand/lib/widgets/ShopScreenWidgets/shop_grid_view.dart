import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/providers/favouritesProvider.dart';
import 'package:local_brand/widgets/ShopScreenWidgets/ShopGridViewItem.dart';

class ShopGridView extends ConsumerWidget {
  const ShopGridView({Key? key,required this.productsList}) : super(key: key);
  final List<Product> productsList;
  @override
  Widget build(BuildContext context,ref) {
    return Container(
      height:  MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Horizontal spacing between items
          mainAxisSpacing: 8,
          childAspectRatio: 0.60,// Vertical spacing between items
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return ShopGridViewItem(product: productsList[index],isFavourite: ref.read(favoriteProductProvider.notifier).isProductInFavorites(productsList[index]),);
        },
      ),
    )
    ;
  }
}
