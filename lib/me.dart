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
      theme: new ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
      ),
      home: new Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: new AppBar(
          title: new Text('我'),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                height: 80.0,
                child: new ListTile(
                  leading: new Icon(Icons.people),
                  title: new Text('Charles&Keith'),
                  subtitle: new Text('微信号：charleskeith'),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                  onTap: (){
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(
//                            builder: (context){
//                              return new MInfoVC();
//                            }
//                        )
//                    );
                  },
                ),
                color: Colors.white,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.call_to_action),
                  title: new Text('钱包'),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                  onTap: (){
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(
//                            builder: (context){
//                              return new MWalletVC();
//                            }
//                        )
//                    );
                  },
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.dashboard),
                  title: new Text('收藏'),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                ),
                color: Colors.white,
                height: 50.0,
              ),
              color: Colors.grey[200],
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('相册'),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.credit_card),
                title: new Text('卡包'),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.tag_faces),
                title: new Text('表情'),
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              color: Colors.white,
              height: 50.0,
            ),
            new Container(
              padding:const EdgeInsets.only(top: 20.0),
              child: new Container(
                child: new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text('设置'),
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