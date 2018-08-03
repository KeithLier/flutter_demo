
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

final googleSignIn = new GoogleSignIn();

//GoogleSignIn _googleSignIn = new GoogleSignIn(
//  scopes: <String>[
//    'email',
//    'https://www.googleapis.com/auth/contacts.readonly',
//  ],
//);

class Message extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MessageState();
  }
}

class MessageState extends State<Message> with TickerProviderStateMixin{

  final List<ChatMessage> _message = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  // ignore: new_with_undefined_constructor_default, new_with_undefined_constructor_default
//  GoogleSignInAccount _currentUser = _googleSignIn.currentUser;

  Future<Null> _ensureLoggedIn() async {
//    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
//      setState(() {
//        _currentUser = account;
//      });
//    });
//    if (_currentUser == null) await _googleSignIn.signInSilently();
//    if (_currentUser == null) await _googleSignIn.signIn();
    GoogleSignInAccount user = googleSignIn.currentUser;
    if(user == null) {
      user = await googleSignIn.signInSilently();
    }
    if(user == null) {
      await googleSignIn.signIn();
    }
  }

  Future _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    await _ensureLoggedIn();
    _sendMessage(text: text);
  }

  void _sendMessage({String text}) {
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 300),
          vsync: this
      ),
    );
    setState(() {
      _message.insert(0, message);
    });
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container (
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible (
                  child:new TextField(
                    controller: _textController,
                    onChanged: (String text) {
                      setState(() {
                        _isComposing = text.length > 0;
                      });
                    },
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration(hintText: '发送消息'),
                  )
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS ?
                    new CupertinoButton(
                        child: new Text('发送'),
                        onPressed: _isComposing ? () => _handleSubmitted(_textController.text) : null
                    ) :
                    new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing ? () => _handleSubmitted(_textController.text) : null
                ),
              )
            ],
          ),
        )
    );
  }
  @override
  void dispose() {
    for(ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('聊天室'),
        backgroundColor: Colors.grey[100],
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_,int index) => _message[index],
                itemCount: _message.length,
              )
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
}


const String _name = 'name';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text,this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new GoogleUserCircleAvatar(
                  googleSignIn.currentUser.photoUrl
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  googleSignIn.currentUser.displayName,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
