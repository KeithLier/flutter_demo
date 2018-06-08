import 'package:flutter/material.dart';

class AppDiscover extends StatefulWidget {
  AppDiscover({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppDiscoverState();
  }
}

class AppDiscoverState extends State<AppDiscover> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("发现"),
        ),
        body: new Center(
          child: new Text("Hello Discover"),
        ),
      ),
    );
  }
}