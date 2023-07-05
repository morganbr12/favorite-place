import 'package:favorite_places/model/saved_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends ConsumerState<AddNewProduct> {
  final key = GlobalKey<FormState>();
  final addPlace = SavedPlaces();

  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submit() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => const Text('No text entered'),
      );
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);
    print(_titleController);
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
              ElevatedButton.icon(
                onPressed: submit,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
