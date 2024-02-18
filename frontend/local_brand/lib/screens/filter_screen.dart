
import 'package:flutter/material.dart';
import 'package:local_brand/widgets/FilterScreenWidgets/checkbox.dart';
import 'package:local_brand/widgets/FilterScreenWidgets/sort_by_radio.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/second_app_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.filterAndSortProducts,
  }) : super(key: key);

  final Function(String sortBy, int? minPrice, int? maxPrice) filterAndSortProducts;
  @override
  _FilterScreenState createState() => _FilterScreenState();
}
class _FilterScreenState extends State<FilterScreen> {



  //sortingBy
  //-----------------------------------//
  String selectedValue = 'Newest';
  void onRadioChanged(String? value) {
    setState(() {
      selectedValue = value!;
    });
  }
  //-----------------------------------//





  //FilteringByPrice
  //-----------------------------------//
  int minPrice = 0; // Adjust default values as needed
  int maxPrice = 99999; // Adjust default values as needed
  void onPriceChanged(List<String?> prices) {
    // Handle null or empty cases gracefully
    if (prices == null || prices.isEmpty) {
      return;
    }
    List<int> PricesValues = [];
    // Initialize or reset minPrice and maxPrice

    // Validate each price range and update min/max accordingly
    for (String? priceRange in prices) {
      if (priceRange == null || priceRange.isEmpty) {
        continue; // Skip empty entries
      }
      List<String> parts = priceRange.split("-");
      if (parts.length != 2) {
        // Handle invalid format gracefully
        print("Invalid price range format: $priceRange");
        continue;
      }

      try {
        int min = int.parse(parts[0]);
        int max = int.parse(parts[1]);
        PricesValues.add(max);
        PricesValues.add(min);
        // Ensure valid range (min <= max)
        if (min > max) {
          print("Invalid price range: $priceRange (min > max)");
          continue;
        }

        // Update minPrice and maxPrice based on minimum and maximum values
        maxPrice = PricesValues.reduce((curr, next) => curr > next? curr: next);
        minPrice = PricesValues.reduce((curr, next) => curr < next? curr: next);
        print(minPrice);
        print(maxPrice);
      } catch (error) {
        // Handle parsing errors gracefully
        print("Error parsing price range: $priceRange");
        continue;
      }
    }
  }
  //-----------------------------------//





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(24*4),child: SecondAppBar(title: "Filter",)),
      body: ListView(children: [
        SortByRadio(onChanged: onRadioChanged,),
       SortByCheckbox(onChanged: onPriceChanged,options: ['100-300','300-800','800-1500','1500-2500','over 2500'],),
        BigButton(onPressedFunction: (){widget.filterAndSortProducts(selectedValue,minPrice,maxPrice);Navigator.pop(context);}, title: "apply", color: Colors.black, textColor: Colors.white)
      ],),
    );
  }
}
