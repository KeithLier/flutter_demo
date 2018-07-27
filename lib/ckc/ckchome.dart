import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'message.dart';

class CKCHome extends StatefulWidget {
  CKCHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CKCHomeState();
  }
}

class CKCHomeState extends State<CKCHome> {
  
  var IPAddress = 'Unknown';
  getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['origin'];
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    if(!mounted) {
      return;
    }
    setState(() {
      IPAddress = result;
    });
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
          title: new Text('首页'),
          backgroundColor: Colors.grey[200],
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.message),
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (context){
                            return new Message();
                          }
                      )
                  );
                })
          ],
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Your current IP address is:'),
              new Text('$IPAddress'),
              new SizedBox(height: 32.0),
              new RaisedButton(
                  onPressed: getIPAddress,
                  child: new Text('Get IP address'),
              )
            ],
          ),
        ),
      ),
    );
  }
}