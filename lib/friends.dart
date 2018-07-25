import 'package:flutter/material.dart';
import 'image_picker_channel.dart';
import 'dart:io';

class FriendsList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FriendsState();
  }
}

class FriendsState extends State<FriendsList> {

  ImagePicker _imagePicker = new ImagePickerChannel();

  File _imageFile;

  void captureImage(ImageSource captureMode) async {
    try {
      var imageFile = await _imagePicker.pickImage(imageSource: captureMode);
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
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                      height: 204.0,
                      child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              title: new Center(child: new Text('拍摄', textAlign: TextAlign.center)),
                              subtitle: new Center(child: new Text('照片或视频', textAlign: TextAlign.center)),
                                onTap: () => captureImage(ImageSource.photos)
                            ),
                            new ListTile(
                              title: new Center(child: new Text('从手机相册选择', textAlign: TextAlign.center)),
                              onTap: () => captureImage(ImageSource.camera)
                            ),
                            new ListTile(
                              title: new Center(child: new Text('取消', textAlign: TextAlign.center)),
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
