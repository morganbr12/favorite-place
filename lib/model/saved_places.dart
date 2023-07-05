import 'package:favorite_places/provider/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPlaces extends StateNotifier<List<Places>> {
  SavedPlaces() : super(const []);

  void addPlace(String title) {
    final newPlace = Places(name: title);

    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<SavedPlaces, List<Places>>(
  (ref) => SavedPlaces(),
);
