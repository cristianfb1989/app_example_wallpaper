import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;
  Post(this.title, this.description);
}

Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(
      search.length,
      (index) =>
          Post("Title : $search $index", "Description : $search $index"));
}

class SearchBarTool extends StatefulWidget {
  @override
  _SearchBarToolState createState() => _SearchBarToolState();
}

class _SearchBarToolState extends State<SearchBarTool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar<Post>(
                    onSearch: search,
                    onItemFound: (item, index) {
                      return ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.description));
                    },
                    hintText: "Search for people",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.indigo),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    iconActiveColor: Colors.indigo))));
  }
}
