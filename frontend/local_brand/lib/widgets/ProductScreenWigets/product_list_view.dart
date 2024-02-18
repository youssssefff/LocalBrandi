import 'package:flutter/material.dart';
import 'package:local_brand/widgets/ProductScreenWigets/product_list_view_item.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key,required this.productImagesList}) : super(key: key);
  final List<String> productImagesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productImagesList.length,
        itemBuilder: (context, index) {
          return  ProductListViewItem(url: productImagesList[index],);
        },
      ),
    );
  }
}
