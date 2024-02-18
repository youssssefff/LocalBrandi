import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_brand/models/place.dart';
import 'package:local_brand/screens/maps_screen.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;


class LocationInput extends StatefulWidget {
  const LocationInput({Key? key, required this.onSelectLocation})
      : super(key: key);
  final void Function(PlaceLocation Location) onSelectLocation;
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _PickedLocation;
  bool isGettingLocation = false;
  String get LoctionImage {
    if (_PickedLocation == null) {
      return "";
    }
    final lat = _PickedLocation!.latitude;
    final lng = _PickedLocation!.longitude;
    print(lat);
    print(lng);
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap &markers=color:redd%7Clabel:A%7C$lat,$lng.015794&key=AIzaSyAexshW1O44mkCkzyeyeD2js-SLaOxyCFI";
  }
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      isGettingLocation = true;
    });
    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    _SavePlace(lat!, lng!);
  }
  Future _SavePlace (double lat ,double lng) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyAexshW1O44mkCkzyeyeD2js-SLaOxyCFI");
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData["results"][0]["formatted_address"];
    setState(() {
      _PickedLocation =
          PlaceLocation(longitude: lng!, latitude: lat!, address: address);
      isGettingLocation = false;
    });
    widget.onSelectLocation(_PickedLocation!);

  }
  void _setOnMap() async {
    final PickedLocation = await Navigator.of(context).push<LatLng>(MaterialPageRoute(
        builder: (context) => MapsScreen(location: PlaceLocation(longitude: 0, latitude: 0, address: ""),)));
    if(PickedLocation == null)return;
    _SavePlace(PickedLocation.latitude, PickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = const Text(
      "No Location Choden",
      textAlign: TextAlign.center,
    );

    if (isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }
    if (_PickedLocation != null) {
      previewContent = Image.network(
        LoctionImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor.withOpacity(0.1))),
          height: 8*24,
          width: double.infinity,
          child: previewContent,
        ),
        Row(
          children: [
            Container(
              width: 170,
              child: TextButton.icon(
                    onPressed: _getCurrentLocation,
                    icon: const Icon(Icons.location_on),
                    label: const Text("get current Location")),
            ),
            Container(
    width: 170,
              child: TextButton.icon(
                  onPressed: _setOnMap,
                  icon: const Icon(Icons.map),
                  label: const Text("get Location on Map")),
            )
          ],
        )
      ],
    );
  }
}

