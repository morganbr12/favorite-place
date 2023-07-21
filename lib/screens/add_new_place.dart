import 'dart:io';

import 'package:favorite_places/model/saved_places.dart';
import 'package:favorite_places/provider/places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends ConsumerState<AddNewProduct> {
  final key = GlobalKey<FormState>();
  File? _selectedImage;
  late PlaceLocation _selectedPlace;

  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submit() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedPlace == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          content: Text(
            textAlign: TextAlign.center,
            'No message entered or no image selected',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      );
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!, _selectedPlace);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a place';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // input image here
                ImageInput(
                  onPickImage: (image) {
                    _selectedImage = image;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                LocationInput(
                  location: (location) {
                    _selectedPlace = location;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //
                ElevatedButton.icon(
                  onPressed: submit,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
