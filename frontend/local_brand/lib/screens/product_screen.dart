import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/ordered_product.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/providers/BagProvider.dart';
import 'package:local_brand/providers/favouritesProvider.dart';
import 'package:local_brand/widgets/global/HorizontalListView/horizontal_list_view.dart';
import 'package:local_brand/widgets/ProductScreenWigets/product_description_box.dart';
import 'package:local_brand/widgets/ProductScreenWigets/product_list_view.dart';
import 'package:local_brand/widgets/ProductScreenWigets/product_main_image.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/second_drop_down_box.dart';
import 'package:local_brand/widgets/global/SizeModal/size_modal.dart';

class ProductScreen extends ConsumerStatefulWidget {
  ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  String currentSize = "M";
  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final id = widget.product.id;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextW500F16(
            color: Colors.black,
            link: false,
            text: widget.product.title,
          )),
      body: ListView(
        children: [
          ProductMainImage(),
          SizedBox(
            height: 4,
          ),
          ProductListView(
            productImagesList: widget.product.images,
          ),
          SizedBox(
            height: 32,
          ),
          ProductDescriptionBox(
            product: widget.product,
          ),
          SizedBox(
            height: 8 * 4,
          ),
          SecondDropDownBox(
            title: "Size and Fit",
            onPressedFunction: () async {
              await showModalBottomSheet(
                context: context,
                builder: (context) => SizeModal(),
              );
            },
          ),
          //SecondDropDownBox(title: "Reviews", onPressedFunction: () {}),
          SizedBox(
            height: 8 * 4,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BigButton(
                onPressedFunction: () {
                  final isInBag = ref
                      .read(BagProvider.notifier)
                      .isInBag(widget.product);
                  if (!isInBag) {
                    ref
                        .read(BagProvider.notifier)
                        .addProductToBag(OrderedProduct(product: widget.product, quantity: 1, size: widget.currentSize));
                  }
                  ;
                },
                color: Colors.black,
                textColor: Colors.white,
                title: "Add To Bag"), //add to bag button
          ),
          SizedBox(
            height: 8 * 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BigButton(
                onPressedFunction: () {
                  if(!ref.read(favoriteProductProvider.notifier).isProductInFavorites(widget.product)){
                  ref
                      .read(favoriteProductProvider.notifier)
                      .toggleProductFavoriteStatus(widget.product);
                }},
                color: Colors.white,
                textColor: Colors.black,
                title: "Favourites"), //add to favourites button
          ),
          SizedBox(
            height: 8 * 4,
          ),

          HorizontalListView(
              title: "You Might Also Like",
              category: widget.product.category,
              gender: "men",
              bestSeller: true,
              newArrival: false),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
