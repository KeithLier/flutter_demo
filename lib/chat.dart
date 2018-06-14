import 'package:flutter/material.dart';

class AppChat extends StatefulWidget {
  AppChat({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppChatState();
  }
}

class AppChatState extends State<AppChat> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat"),
      ),
      body: new Center(
        child: new Text("Hello Chat"),
      ),
    );
  }
}

