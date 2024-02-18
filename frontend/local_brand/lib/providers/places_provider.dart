import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:local_brand/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
    print("yeeedd provider");
  }
}

final userPlacesProvider =
StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
);