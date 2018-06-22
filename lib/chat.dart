import 'package:flutter/material.dart';
import 'package:flutter_app/flip_panel.dart';

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
        title: new Text('Chat'),
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        child: Center(
          child: FlipClock.simple(
            startTime: DateTime.now(),
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 48.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
          ),
        ),
      ),
    );
  }
}

