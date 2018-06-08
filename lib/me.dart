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
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(
                Icons.account_balance_wallet,
              ),
              title: new Text("钱包"),
            ),
            new ListTile(
              leading: new Icon(
                Icons.check_box_outline_blank,
              ),
              title: new Text("收藏"),
            ),
            new ListTile(
              leading: new Icon(
                Icons.photo_library,
              ),
              title: new Text("相册"),
            ),
            new ListTile(
              leading: new Icon(
                Icons.credit_card,
              ),
              title: new Text("卡包"),
            ),
            new ListTile(
              leading: new Icon(
                Icons.tag_faces,
              ),
              title: new Text("表情"),
            ),
            new ListTile(
              leading: new Icon(
                Icons.settings,
              ),
              title: new Text("设置"),
            ),
          ],

        ),
      ),
    );
  }
}