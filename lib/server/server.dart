import 'package:flutter/material.dart';
import 'dart:io';

class Server extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ServerState();
  }
}

class ServerState extends State<Server> {
  @override
  void main() {
    HttpServer.bind(InternetAddress.loopbackIPv4, 8089).then((server){
      print("Serving at ${server.address}:${server.port}");

      server.listen((HttpRequest req){
        req.response
        //获取和设置内容类型（报头）
          ..headers.contentType=new ContentType("text","plain",charset:"utf-8")
        //通过调用Object.toString将Object转换为一个字符串并转成对应编码发送到客户端
          ..write("Hello world! :)")
        //结束与客户端连接
          ..close();
      });
    });
  }
  
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Server'),
        backgroundColor: Colors.grey[200],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed: () {
              main();
            },
              child: new Text('Build Server'),
            )
          ],
        ),        
      ),
    );
  }
}

