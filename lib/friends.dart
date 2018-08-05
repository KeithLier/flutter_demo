import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'main.dart';

class FriendsList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FriendsState();
  }
}

class FriendsState extends State<FriendsList> {

  ImagePicker _imagePicker = new ImagePicker();

  File _imageFile;

    void chooseImage() async{
      try {
        File imageFile = await ImagePicker.pickImage();
        setState(() {
          _imageFile = imageFile;
        });
      }
      catch (e) {
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("朋友圈"),
        backgroundColor: Colors.grey[200],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.camera_alt, color: Colors.black,),
            onPressed: () {
              chooseImage();
            },
          )
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 200.0,
            child: new Image.network('https://www.baidu.com/img/bd_logo1.png?qua=high&where=super'),
          )
        ],
      ),
    );
  }
}
