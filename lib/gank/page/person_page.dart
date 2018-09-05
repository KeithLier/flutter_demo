import 'package:flutter/material.dart';
import 'draw_page.dart';

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
      drawer: new Drawer(
        child: new DrawPage(

        ),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          color: new Color(0xFFEBEBEB),
          child: new Column(
            children: <Widget>[

            ],
          ),
        ),
      )
    );
  }
}