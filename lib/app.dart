import 'package:flutter/material.dart';

import 'home.dart';
import 'contact.dart';
import 'discover.dart';
import 'me.dart';

class AppMain extends StatefulWidget {
  AppMain({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppMainState();
  }
}

class AppMainState extends State<AppMain> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
            controller: controller,
            children: [
              new AppHome(),
              new AppContact(),
              new AppDiscover(),
              new AppMe(),
            ]
        ),
        bottomNavigationBar: new Material(
          color: Colors.black12,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.black,
            tabs:[
              new Tab(
                text: "微信",
                icon: new Icon(
                  Icons.message,
                ),
              ),
              new Tab(
                text: "通讯录",
                icon: new Icon(
                  Icons.contacts,
                ),
              ),
              new Tab(
                text: "发现",
                icon: new Icon(
                  Icons.contact_mail,
                ),
              ),
              new Tab(
                text: "我",
                icon: new Icon(
                  Icons.people,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}