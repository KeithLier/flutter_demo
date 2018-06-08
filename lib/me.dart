import 'package:flutter/material.dart';

class AppMe extends StatefulWidget {
  AppMe({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppMeState();
  }
}

class AppMeState extends State<AppMe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("我"),
        ),
        body: new Center(
          child: new Text("Hello Me"),
        ),
      ),
    );
  }
}