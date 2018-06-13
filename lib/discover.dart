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
      theme: new ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("发现"),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                height: 50.0,
                child: new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text("朋友圈"),
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: new Container(
                height: 50.0,
                child: new ListTile(
                  leading: new Icon(Icons.crop_free),
                  title: new Text("扫一扫"),
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}