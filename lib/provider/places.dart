import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;
  final String address;
}

class Places {
  Places({
    required this.name,
    required this.image,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  final String? id;
  final String name;
  final File image;
  final PlaceLocation location;
}
