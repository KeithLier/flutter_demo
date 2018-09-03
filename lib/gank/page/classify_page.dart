import 'package:flutter/material.dart';

class ClassifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassifyPageState();
  }
}

class ClassifyPageState extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('分类阅读'),
        backgroundColor: Colors.grey[100],
      ),
      body: new Center(
        child: new Text('敬请期待')
      ),
    );
  }
}