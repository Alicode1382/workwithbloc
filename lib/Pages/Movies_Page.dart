import 'package:flutter/material.dart';

class Moviespage extends StatelessWidget {
  const Moviespage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("movies app"),
      ),
      body: new Center(
        child: new Text(
          "hello",
          style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
