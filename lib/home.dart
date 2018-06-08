import 'package:flutter/material.dart';

import 'contact.dart';
import 'discover.dart';
import 'me.dart';

class AppHome extends StatefulWidget {
  AppHome({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppHomeState();
  }
}

class AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("微信"),
        ),
        body: new Center(
          child: new Text("Hello Chat"),
        ),
      ),
    );
  }
}