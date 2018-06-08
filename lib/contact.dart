import 'package:flutter/material.dart';

class AppContact extends StatefulWidget {
  AppContact({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppContactState();
  }
}

class AppContactState extends State<AppContact> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("通讯录"),
        ),
        body: new Center(
          child: new Text("Hello Contact"),
        ),
      ),
    );
  }
}