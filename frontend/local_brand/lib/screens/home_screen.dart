import 'package:flutter/material.dart';
import 'package:local_brand/widgets/HomeScreenWidgets/home_banner.dart';
import 'package:local_brand/widgets/global/HorizontalListView/horizontal_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        HomeBanner(),
        SizedBox(height: 8*4,),
        HorizontalListView(
            title: "New Arrivals",
            bestSeller: false,
            newArrival: true,
            gender: "men",
            category: "hoodie"),
      ]),
    );
  }
}
