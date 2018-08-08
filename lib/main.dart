import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:flutter_app/ckc/sign.dart';
import 'app.dart';


void main() {
  _getLandingFile().then((onValue) {
    runApp(new MyApp(onValue.existsSync()));
  });

}

Future<File> _getLandingFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/LandingInfomation');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp(this.landing);

  final bool landing;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.light,
      ),
      home: landing ? new AppMain(title: 'Flutter Demo Home Page') : new SignIn()
    );
  }
}
