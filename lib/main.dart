import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'app.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.light,
      ),
      home: new AppMain(title: 'Flutter Demo Home Page'),
    );
  }
}
