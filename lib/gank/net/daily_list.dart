import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gank/ext/constant.dart' as ext;

class DailyList extends StatefulWidget {
  final String url;

  DailyList({Key key, this.url}) :super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DailyListState();
  }
}


class DailyListState extends State<DailyList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
