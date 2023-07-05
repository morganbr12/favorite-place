import 'package:favorite_places/model/saved_places.dart';
import 'package:favorite_places/provider/places.dart';
import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/addNewPlace'),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: PlacesList(
        places: userPlaces,
      ),
    );
  }
}

class PlacesList extends StatelessWidget {
  const PlacesList({
    required this.places,
    super.key,
  });

  final List<Places> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'You have no places',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) {
        final place = places[index];
        return ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailsScreen(place: place),
            ),
          ),
          title: Text(
            place.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
