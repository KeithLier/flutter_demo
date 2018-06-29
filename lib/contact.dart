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


  @override
  Widget build(BuildContext context) {
    List<Map> list;
    list = <Map>[
      {
        'image': '1',
        'name': '新朋友',
        'id': '1'
      },
      {
        'image': '2',
        'name': '群聊',
        'id': '2'
      },
      {
        'image': '3',
        'name': '标签',
        'id': '3'
      },
      {
        'image': '4',
        'name': '公众号',
        'id': '4'
      },
      {
        "title":"我的企业"
      },
      {
        'image': '5',
        'name': '桦洁商贸',
        'id': '5'
      },
      {
        'image': '6',
        'name': 'CK',
        'id': '6'
      },
      {
        "title":"A"
      },
      {
        'image': '7',
        'name': '阿猫',
        'id': '11'
      },
      {
        'image': '8',
        'name': '阿狗',
        'id': '12'
      },
      {
        'image': '9',
        'name': '爱玩',
        'id': '13'
      },
      {
        'image': '10',
        'name': 'andy',
        'id': '14'
      },
      {
        "title":"B"
      },
      {
        'image': '11',
        'name': 'Bro',
        'id': '21'
      },
      {
        'image': '12',
        'name': '百合',
        'id': '22'
      },
      {
        'image': '13',
        'name': '百事可乐',
        'id': '23'
      },
      {
        'image': '14',
        'name': '爆菊',
        'id': '24'
      }
    ];

    var items = [];
    for(var i = 0; i < list.length; i++) {
      var l = list[i];
      if(l.containsKey("title")) {
        var hi = new HeadingItem(l["title"]);
        items.add(hi);
      } else {
        var ci = new ContactItem(l["id"],l["name"],l["image"]);
        items.add(ci);
      }
    }
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
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if(item is HeadingItem) {
              return new ListTile(
                title: new Text(
                  item.title,
                  style: Theme.of(context).textTheme.subhead,
                ),
              );
            } else if (item is ContactItem) {
              return new ListTile(
                leading: new CircleAvatar(
                    child: new Text(item.image)
                ),
                title: new Text(item.name),
              );
            }
          },
        ),
      ),
    );
  }
}

abstract class ListItem {

}

class HeadingItem implements ListItem {
  final String title;

  HeadingItem(this.title);
}

class ContactItem implements ListItem {
  final String  name;
  final String  id;
  final String  image;

  ContactItem(this.id,this.name,this.image);
}