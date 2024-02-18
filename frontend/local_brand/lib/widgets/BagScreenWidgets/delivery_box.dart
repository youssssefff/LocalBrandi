import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_brand/models/place.dart';
import 'package:local_brand/screens/maps_screen.dart';
import 'package:local_brand/widgets/BagScreenWidgets/location_input.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class DeliveryBox extends StatelessWidget {
  DeliveryBox({Key? key}) : super(key: key);
  PlaceLocation? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    DateTime deliveryDate = currentDate.add(Duration(days: 2));

    String formattedDeliveryDate = DateFormat('E, d MMM').format(deliveryDate);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextW500F16(text: 'Delivery', link: false, color: Colors.black),
          const SizedBox(height: 8),
          TextW400F16(text: 'Arrives $formattedDeliveryDate', link: false, color: Colors.black),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextW400F16(text: 'to ${DateFormat('E, d MMM').format(deliveryDate.add(Duration(days: 2)))}', link: false, color: Colors.black),
              const SizedBox(width: 8),
              GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => MapsScreen(location: PlaceLocation(latitude: 1,longitude: 1,address: "d")))),child: TextW500F16(text: 'Edit Location', link: false, color: Colors.black))
            ],
          ),const SizedBox(height: 16),LocationInput(onSelectLocation:  (location) {
            _selectedLocation = location;
          },)
        ],
      ),
    );
  }
}
