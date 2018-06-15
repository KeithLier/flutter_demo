import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class AppContact extends StatefulWidget {
  AppContact({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppContactState();
  }
}

class AppContactState extends State<AppContact> {

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/contact.json');
  }

  Future<List> _readContacts() async {
    try {
      File file = await _getLocalFile();
      String string = await file.readAsString();

    } on FileSystemException {

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("通讯录"),
        ),
        body: new ListView(

        ),
      ),
    );
  }
}