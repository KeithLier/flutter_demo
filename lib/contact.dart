import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class AppContact extends StatefulWidget {
  AppContact({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppContactState();
  }
}

class AppContactState extends State<AppContact> {

  Widget buildListTitle(BuildContext context, Map item) {
    return new ListTile(
      isThreeLine: true,
      dense: false,
      leading: new CircleAvatar(child: new Text(item['image'])),
      title: new Text(item['title']),
      trailing: new Icon(Icons.keyboard_arrow_right),
    );
  }

//  Widget buildContainer(BuildContext context, Map item) {
//
//  }

  @override
  Widget build(BuildContext context) {
    List<Map> list;
    list = <Map>[
      {
        'title': '',
        'data': [
          {
            'image': '',
            'name': '新朋友',
            'id': '1'
          },
          {
            'image': '',
            'name': '群聊',
            'id': '2'
          },
          {
            'image': '',
            'name': '标签',
            'id': '3'
          },
          {
            'image': '',
            'name': '公众号',
            'id': '4'
          }
        ]
      },
      {
        'title': '我的企业',
        'data': [
          {
            'image': '',
            'name': '桦洁商贸',
            'id': '5'
          },
          {
            'image': '',
            'name': 'CK',
            'id': '6'
          }
        ]
      },
      {
        'title': 'A',
        'data': [
          {
            'image': '',
            'name': '阿猫',
            'id': '11'
          },
          {
            'image': '',
            'name': '阿狗',
            'id': '12'
          },
          {
            'image': '',
            'name': '爱玩',
            'id': '13'
          },
          {
            'image': '',
            'name': 'andy',
            'id': '14'
          }
        ]
      },
      {
        'title': 'B',
        'data': [
          {
            'image': '',
            'name': 'Bro',
            'id': '21'
          },
          {
            'image': '',
            'name': '百合',
            'id': '22'
          },
          {
            'image': '',
            'name': '百事可乐',
            'id': '23'
          },
          {
            'image': '',
            'name': '爆菊',
            'id': '24'
          }
        ]
      }
    ];
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('通讯录'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.group_add,color: Colors.black,),
                onPressed: null
            ),
          ],
        ),
        body: new ListView(

        ),
      ),
    );
  }
}