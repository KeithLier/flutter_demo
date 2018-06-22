import 'package:flutter/material.dart';
import '';
class MyInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyInfoState();
  }
}


class MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的信息"),
        backgroundColor: Colors.grey[100],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 20.0),
            color: Colors.grey[200],
            child: new Container(
              color: Colors.white,
              height: 80.0,
              child: new ListTile(
                title: new Text("头像"),
                trailing: new Image.asset("images/wechat.png",width: 50.0,height: 50.0,),
              ),
            ),
          )
        ],
      ),
    );
  }
}