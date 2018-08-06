import 'package:flutter/material.dart';

class PromptPage {
  showMessage(BuildContext context,String title, String message) {
    showDialog<Null>(
        context: context,
      child: new AlertDialog(
        title: new Text(title != null ? title : ''),
        content: new Text(message != null ? message : ''),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Text('OK')
          )
        ],
      )
    );
  }
}