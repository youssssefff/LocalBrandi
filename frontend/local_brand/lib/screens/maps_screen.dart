import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_brand/models/place.dart';
class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key, required this.location , this.isSelecting = true})
      : super(key: key);
  final PlaceLocation location;
  final bool isSelecting;
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? _PickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        widget.isSelecting ? Text("PICK LOCATION") : Text("YOUR LOCATION"),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(_PickedLocation);
              },
            )
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelecting ?null: (p){_PickedLocation = p;},
        initialCameraPosition: CameraPosition(
            zoom: 16,
            target:
            LatLng(widget.location.latitude, widget.location.longitude)),
        markers: (_PickedLocation != null && widget.isSelecting)? {} : {
          Marker(
              markerId: const MarkerId("m1"),
              position: _PickedLocation != null ? _PickedLocation! :
              LatLng(widget.location.latitude, widget.location.longitude))
        },
      ),
    );
  }
}
