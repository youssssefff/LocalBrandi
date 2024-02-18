import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/widgets/global/HorizontalListView/horizontal_list_item.dart';
import 'package:http/http.dart' as http;
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f24.dart';

class HorizontalListView extends StatefulWidget {
  HorizontalListView(
      {Key? key,
      required this.title,
      required this.category,
      required this.gender,
      required this.bestSeller,
      required this.newArrival})
      : super(key: Key(gender));
  final title;
  final category;
  final gender;
  final bool bestSeller;
  final newArrival;

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<Product> productsList = [];
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      final Uri uri = Uri.parse(
          'http://192.168.1.8:8080/api/products/getProductWhere?gender=${widget.gender}&bestSeller=${widget.bestSeller}&newArrival=${widget.newArrival}');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        List<Product> pList = [];
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data')) {
          var productsData = jsonResponse['data'];
          for (var item in productsData) {
            Product product = Product.fromJson(item);
            pList.add(product);
          }
        }
        setState(() {
          productsList = pList;
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextW500F24(text: widget.title),
          SizedBox(
            height: 8 * 2,
          ),
          Container(
            height: 8 * 34,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return HorizontalListItem(
                  product: productsList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
