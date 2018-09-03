import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonPageState();
  }
}

class PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
        backgroundColor: Colors.grey[100],
      ),
      body: new Center(
          child: new Text('敬请期待')
      ),
    );
  }
}