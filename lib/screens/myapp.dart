import 'package:favorite_places/model/saved_places.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:favorite_places/screens/home.dart';
import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomePage(),
        '/addNewPlace': (ctx) => const AddNewProduct(),
      },
    );
  }
}
