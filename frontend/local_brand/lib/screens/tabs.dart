import 'package:flutter/material.dart';
import 'package:local_brand/screens/bag_screen.dart';
import 'package:local_brand/screens/favourite_screen.dart';
import 'package:local_brand/screens/home_screen.dart';
import 'package:local_brand/screens/main_shop_screen.dart';
import 'package:local_brand/screens/profile_screen.dart';
import 'package:local_brand/screens/shop_screen.dart';
import 'package:local_brand/widgets/global/second_app_bar.dart';

class Tabs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabsState();
  }
  
}
class TabsState extends State<Tabs>{
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget _activePage = const HomeScreen();
    String title = "home";
    if (_selectedPageIndex == 1){
      _activePage = MainShopScreen();
      title = "shop";
    }
    if (_selectedPageIndex == 2){
      _activePage = const FavouriteScreen();
      title = "favourite";
    }
    if (_selectedPageIndex == 3){
      _activePage = const BagScreen();
      title = "bag";
    }
    if (_selectedPageIndex == 4){
      _activePage = const ProfileScreen();
      title = "profile";
    }
    // TODO: implement build
    return Scaffold(
      appBar: _selectedPageIndex != 4 ? PreferredSize(preferredSize: Size.fromHeight(24*4),child: SecondAppBar(title: title,)): null,
      body:_activePage,bottomNavigationBar: BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Colors.white,
      currentIndex: _selectedPageIndex,

      items:const  [
        BottomNavigationBarItem(
          label: "home",
          backgroundColor: Colors.white,

          icon: Icon(Icons.holiday_village_outlined,color: Colors.black)),
        BottomNavigationBarItem(
          label: "shop",
            icon: Icon(Icons.search,color: Colors.black)),
        BottomNavigationBarItem(
            label: "favourites",
            icon: Icon(Icons.favorite_border,color: Colors.black)),
        BottomNavigationBarItem(
            label: "bag",
            icon: Icon(Icons.shopping_bag_outlined,color: Colors.black)),
        BottomNavigationBarItem(
            label: "profile",
            icon: Icon(Icons.person_2_outlined,color: Colors.black)),
      ],
    ),);
  }
  
}