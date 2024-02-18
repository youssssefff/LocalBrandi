

import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();
class PlaceLocation{
  PlaceLocation({ required this.longitude,required this.latitude,required this.address});
  final double longitude;
  final double latitude;
  final String address;
}
class Place {
  Place({required this.title, required this.image,required this.location, id}) : id = id ?? uuid.v4();
  final String id;
  final String title;
  final File? image;
  final PlaceLocation location;
}
