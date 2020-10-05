import 'dart:convert';

import 'package:app_example_wallpaper/global.dart';
import 'package:app_example_wallpaper/models/photos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  String url = 'https://api.pexels.com/v1/search?query=people';

  @override
  void initState() {
    super.initState();
    getWallpaper();
  }

  getWallpaper() async {
    await http
        .get(url, headers: {"Authorization": "PEXELS_API_KEY"}).then((value) {
      var parsedJson = jsonDecode(value.body);
      Global.photos = (parsedJson["photos"] as List)
          .map((e) => Photos.fromJson(e))
          .toList();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text('Wallpapers'),
            elevation: 5.0,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).pushNamed('SearchBar');
                      }))
            ]),
        body: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: GridView.builder(
                itemCount: Global.photos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Global.index = index;
                        Navigator.of(context).pushNamed('FullImage');
                      },
                      child: Hero(
                          tag: '$index',
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Global.photos[index].src.tiny),
                                      fit: BoxFit.cover)))));
                })));
  }
}
