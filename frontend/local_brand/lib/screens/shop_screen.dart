import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/product.dart';
import 'package:local_brand/providers/favouritesProvider.dart';
import 'package:local_brand/providers/productsProvider.dart';
import 'package:local_brand/screens/filter_screen.dart';
import 'package:local_brand/widgets/global/CategoryListView/category_view.dart';
import 'package:local_brand/widgets/ShopScreenWidgets/shop_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen(
      {Key? key,
      required this.title,
      required this.gender,
      required this.category})
      : super(key: key);
  final String title;
  final category;
  final gender;

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  void initState() {
    super.initState();
    getProducts();
    for (Product product in productsList) {
      ref.read(productProvider.notifier).addProducts(product);
    }
  }



  //filteringAndSorting
  //--------------------------------------------//
  List<Product> productsList = [];
  List<Product> finalProductList = [];
  void filterAndSortProducts(String sortBy,int? minPrice, int? maxPrice){
    List<Product> ProductList = List.from(productsList);
    print(sortBy);
    if(sortBy == 'Price: High-Low')
      {
        print("yes");
        ProductList.sort((a, b) => a.price.compareTo(b.price));
      }
    if(sortBy == 'Price: Low-High') {
      ProductList.sort((a, b) => b.price.compareTo(a.price));
    }
    if(sortBy == "Newest"){
    }
    if(minPrice != null && maxPrice !=null){
      ProductList = ProductList.where((product) => product.price >= minPrice && product.price <= maxPrice).toList();
    }
    print('--------------------------------------------');
    print(ProductList);
    print('--------------------------------------------');
    setState(() {
      finalProductList =ProductList;
    });
  }
  //--------------------------------------------//




  //fetchingProducts
  //--------------------------------------------//
  Future<void> getProducts() async {
    try {
      final Uri uri = Uri.parse(
          'http://192.168.1.8:8080/api/products/getProductWhere?gender=${widget.gender}&category=${widget.category}');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        List<Product> pList = [];
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data')) {
          var productsData = jsonResponse['data'];
          for (var item in productsData) {
            Product product = Product.fromJson(
                item); // Assuming you have a Product class with a fromJson method
            pList.add(product);
          }
        }
        setState(() {
          print(pList);
          productsList = pList;
          finalProductList = productsList;
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  //--------------------------------------------//




  //categorizing
  //--------------------------------------------//
  List<String> categoriesList = [
    "all",
    "sweetshirts",
    "t-shirts",
    "hoodies",
    "jackets",
    "pants",
    "short-pants",
    'socks'
  ];
  List<String> ExeptionWordList = ['socks'];
  int _currentSelection = 0;
  void updateCurrentSelection(int index) {
    setState(() {
      _currentSelection = index;
      if (index == 0) {
        finalProductList = productsList;
      } else if (ExeptionWordList.contains(categoriesList[index])) {
        finalProductList = productsList
            .where((product) => product.subCategory == categoriesList[index])
            .toList();
      } else {
        finalProductList = productsList
            .where((product) =>
                product.subCategory ==
                categoriesList[index]
                    .substring(0, categoriesList[index].length - 1))
            .toList();
      }
    });
  }
  //--------------------------------------------//



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterScreen(filterAndSortProducts: filterAndSortProducts,)));
              // Perform search action
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              // Perform search action
              final String? result = await showSearch<String>(
                context: context,
                delegate: ProductSearch(products: finalProductList),
              ) as String?;

              // Handle the search result if needed
              if (result != null && result.isNotEmpty) {
                // Do something with the search result
                print('Search result: $result');
              }
            },
          )
        ],
        title: TextW500F16(text: widget.title, link: false, color: Colors.black)
      ),
      body: ListView(
        children: [
          CategoryView(
            categories: categoriesList,
            callback: updateCurrentSelection,
            currentSelction: _currentSelection,
          ),
          ShopGridView(
            productsList: finalProductList,
          )
        ],
      ),
    );
  }
}

//search

class ProductSearch extends SearchDelegate<String> {
  final List<Product> products;

  ProductSearch({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final List<Product> searchResults = products
        .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ShopGridView(productsList: searchResults);
      },
    );
  }
}