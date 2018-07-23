import 'package:flutter/material.dart';

class FriendsList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FriendsState();
  }
}

class FriendsState extends State<FriendsList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("朋友圈"),
          backgroundColor: Colors.grey[200],
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.camera_alt, color: Colors.black,),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return new Container(
                          child: new Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(
                              children: <Widget>[
                                new ListTile(
                                  title: new Text('拍摄'),
                                  subtitle: new Text('照片或视频'),
                                  onTap: (){

                                  },
                                ),
                                new ListTile(
                                  title: new Text('从手机相册选择'),
                                  onTap: (){

                                  },
                                ),
                                new ListTile(
                                  title: new Text('取消'),
                                  onTap: (){

                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                },
            )
          ],
        ),

        body: new ListView(

        ),
      ),
    );
  }
}
