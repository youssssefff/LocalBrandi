import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_brand/widgets/HomeScreenWidgets/home_banner.dart';
import 'package:local_brand/widgets/global/HorizontalListView/horizontal_list_view.dart';
import 'package:local_brand/widgets/global/CategoryListView/category_view.dart';
import 'package:local_brand/widgets/ShopScreenWidgets/shop_Big_Picture.dart';
import 'package:local_brand/widgets/ShopScreenWidgets/shop_banner.dart';
import 'package:local_brand/widgets/global/drop_down_box.dart';

class MainShopScreen extends StatefulWidget {
  MainShopScreen({Key? key}) : super(key: key);

  @override
  State<MainShopScreen> createState() => _MainShopScreenState();
}

class _MainShopScreenState extends State<MainShopScreen> {
  String gender = "men";
  int _currentSelection = 0;
  String bannerPicture= 'https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lbiUyMG92ZXJzaXplJTIwdHNoaXJ0fGVufDB8fDB8fHww';
  String BigPicture= "https://images.unsplash.com/photo-1488161628813-04466f872be2?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  void updateVariable(int index) {
    _currentSelection = index;
    setState(() {
      if (index == 0) {
        gender = "men";
        bannerPicture =
        "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lbiUyMG92ZXJzaXplJTIwdHNoaXJ0fGVufDB8fDB8fHww";
        BigPicture =
        "https://images.unsplash.com/photo-1488161628813-04466f872be2?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
      } else if (index == 1) {
        gender = "women";
        bannerPicture =
        "https://images.unsplash.com/photo-1558769132-cb1aea458c5e?q=80&w=1548&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
        BigPicture =
        "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
      } else if (index == 2) {
        gender = "kids";
      }
    });
  }


  Widget build(BuildContext context) {
    Color myColor = Color(0xff686963);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CategoryView(
            categories: ["men", "women"],
            callback: updateVariable,
            currentSelction: _currentSelection,
          ),
          ShopBanner(title: bannerPicture,),
          //ShopBanner(title: "https://marketplace.canva.com/EAFwo-2uSNU/1/0/1600w/canva-black-classy-fashion-style-banner-%28landscape%29-GEkYkVZM5aI.jpg",),
          DropDownBox(
            category: "shoes",
            gender: gender,
            icon: FontAwesomeIcons.shoePrints,
            mainIcon: Icons.arrow_forward,
          ),
          DropDownBox(
            category: "clothing",
            gender: gender,
            icon:FontAwesomeIcons.tShirt,
              mainIcon: Icons.arrow_forward
          ),
          DropDownBox(
            category: "accessories",
            gender: gender,
            icon: FontAwesomeIcons.hatCowboySide,
              mainIcon: Icons.arrow_forward
          ),
          ShopBigPicture(title: BigPicture,),
          SizedBox(height: 24,),
          HorizontalListView(title: "Best Sellers",bestSeller: true,newArrival: false,gender: gender, category: "hoodie",),
          SizedBox(height: 24,),
          HorizontalListView(title: "New Arrivals",bestSeller: false,newArrival: true,gender: gender, category: "hoodie"),
        ],
      ),
    );
  }
}
