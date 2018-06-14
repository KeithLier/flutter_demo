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
        backgroundColor: Colors.grey[200],
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
                  trailing: new Icon(Icons.keyboard_arrow_right),
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
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.refresh),
                title: new Text("摇一摇"),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                height: 50.0,
                child: new ListTile(
                  leading: new Icon(Icons.star),
                  title: new Text("看一看"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new Text("搜一搜"),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.people),
                  title: new Text("附近的人"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.hourglass_empty),
                title: new Text("漂流瓶"),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.shopping_cart),
                  title: new Text("购物"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.games),
                title: new Text("游戏"),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding:const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0
              ),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.apps),
                  title: new Text("小程序"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}