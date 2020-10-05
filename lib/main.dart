import 'package:app_example_wallpaper/fullIImage.dart';
import 'package:app_example_wallpaper/searchBar.dart';
import 'package:app_example_wallpaper/wallpapers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'FullImage': (_) => FullImage(),
          'SearchBar': (_) => SearchBarTool()
        },
        home: Wallpaper());
  }
}
