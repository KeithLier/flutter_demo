import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DailyPageState();
  }
}


class DailyPageState extends State<DailyPage> {
  DateTime selectedDate = new DateTime.now();

  final String url = 'https://gank.io/api/today';
  var category = [];
  var results = {};

  Future<Null> loadData() async {
    var httpClient = new HttpClient();

    String result;
    try {
      var rUrl = url + '/' + selectedDate.year.toString() + '/' + selectedDate.month.toString() + '/' + selectedDate.day.toString();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        var category = data['category'];
        var result = data['result'];
        setState(() {
          category = category;
          result = result;
        });
      } else {
        result = 'Error:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed';
    }
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picker = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(2016,1),
        lastDate: new DateTime(2100,1)
    );
    if(picker != null && picker != selectedDate) {
      setState(() {
        selectedDate = picker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('今日干货'),
        backgroundColor: Colors.grey[200],
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(4.0),
            child: new IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  selectDate(context);
                }
            ),
          )
        ],
      ),
      body: new RefreshIndicator(
          child: new FutureBuilder(
              builder: (BuildContext context,AsyncSnapshot snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return new Center(
                      child: new CupertinoActivityIndicator(),
                    );
                  default:
                    if (snapshot.hasError) {
                      return new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Align(
                            alignment: Alignment.center,
                            child: new Image.asset('images/empty_data.png'),
                          ),
                          new Align(
                            alignment: Alignment.center,
                            child: new Text(snapshot.error, style: const TextStyle(color: Colors.grey),),
                          )
                        ],);
                    } else {
                      return null;
                    }
                }
              }
          ),
          onRefresh: loadData
      )
    );
  }
}
