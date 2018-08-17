import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'message.dart';
import 'sign.dart';
import 'package:flutter_app/server/server.dart';
import 'package:flutter_app/Animation/Animation.dart';

class CKCHome extends StatefulWidget {
  CKCHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CKCHomeState();
//    _getLandingFile().then((onvalue) {
//      return CKCHomeState(onvalue.existsSync());
//    });
  }
}

Future<File> _getLandingFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/LandingInfomation');
}

class CKCHomeState extends State<CKCHome> {

//  CKCHomeState(this.landing);

  final bool landing = false;

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
                            return landing ? new Message() : new SignIn();
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
              ),
              new SizedBox(height: 32.0),
              new RaisedButton(
                child: new Text('Build HTTP Server'),
                  onPressed: (){
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context){
                              return Server();
                            }
                        )
                    );
                  }
              ),
              new SizedBox(height: 32.0),
              new RaisedButton(
                  child: new Text('Flutter Animation'),
                  onPressed: (){
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context){
                              return AnimationPage();
                            }
                        )
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}