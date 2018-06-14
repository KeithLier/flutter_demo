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

class AppMainState extends State<AppMain> {

  final List<BottomNavigationBarItem> listSet =
  [new BottomNavigationBarItem(
    icon: new Icon(Icons.chat,color: Colors.grey),
    title: new Text("微信"),
  ),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.perm_contact_calendar,color: Colors.grey,),
    title: new Text("通讯录"),
  ),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.room,color: Colors.grey),
    title: new Text("发现"),
  ),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.perm_identity,color: Colors.grey),
    title: new Text("我"),
  ),
  ];
  final List<StatefulWidget> vcSet = [new AppHome(),new AppContact(),new AppDiscover(),new AppMe()];
  int _sindex=0;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(items: listSet,type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _sindex = index;
          });
        },
        currentIndex: _sindex,
      ),
      body: vcSet[_sindex],
    );
  }

}