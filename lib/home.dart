import 'package:flutter/material.dart';
import 'chat.dart';

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
      dense: false,
      leading: new CircleAvatar(child: new Text(item['image'])),
      title: new Text(item['title']),
      subtitle: new Text(item['subtitle']),
      trailing: new Text(item['date']),
      onTap: (){
        Navigator.of(context).push(
          new MaterialPageRoute(
              builder: (context){
                return new AppChat();
              }
          )
        );
      },
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
          title: new Text('微信'),
          actions: <Widget>[
            new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                    value: 'Toolbar menu',
                    child: const ListTile(
                      leading: const Icon(Icons.message),
                      title: const Text("发起群聊"),
                    )
                ),
                const PopupMenuItem<String>(
                    value: 'Toolbar menu',
                    child: const ListTile(
                      leading: const Icon(Icons.person_add),
                      title: const Text("添加朋友"),
                    )
                ),
                const PopupMenuItem<String>(
                    value: 'Toolbar menu',
                    child: const ListTile(
                      leading: const Icon(Icons.fullscreen),
                      title: const Text("扫一扫"),
                    )
                ),
                const PopupMenuItem<String>(
                    value: 'Toolbar menu',
                    child: const ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text("收付款"),
                    )
                ),
              ],
              icon: new Icon(Icons.add),
            ),
          ],
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