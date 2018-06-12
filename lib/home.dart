import 'package:flutter/material.dart';


class AppHome extends StatefulWidget {
  AppHome({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return new AppHomeState();
  }
}

class AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin {

  Widget buildListTitle(BuildContext context, Map item) {
    return new ListTile(
      isThreeLine: true,
      dense: false,
      leading: new CircleAvatar(child: new Text(item['image'])),
      title: new Text(item['title']),
      subtitle: new Text(item['subtitle']),
      trailing: new Text(item['date']),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Map> items;
    items = <Map>[
      {'title':'习近平','subtitle':'good','image':'X','date':'08:50'},
      {'title':'Duncan','subtitle':'Long time no see','image':'D','date':'07:50'},
      {'title':'mei','subtitle':'have a good time,bye-bye','image':'M','date':'08:50'},
      {'title':'Suzu','subtitle':'are you busy?Give me a help, OK?','image':'S','date':'07:50'},
      {'title':'KOBE','subtitle':'Hello','image':'K','date':'07:30'}
    ];
    Iterable<Widget> listTitles=items.map((Map item){
      return buildListTitle(context, item);
    });
    listTitles=ListTile.divideTiles(context: context,tiles: listTitles);
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("微信"),
        ),
        body: new Scrollbar(
          child: new ListView(
            children: listTitles.toList(),
          ),
        ),
      ),
    );
  }
}