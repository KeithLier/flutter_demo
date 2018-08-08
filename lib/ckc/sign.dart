import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SignInState();
  }
}

class SignInState extends State<SignIn> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  Future<int> _saveLogin(String phone, String password) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await new File('$dir/LandingInformation').writeAsString(
        '{"phone":"$phone","name":"$password"}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign In'),
        backgroundColor: Colors.grey[100],
        leading: new CloseButton(),
      ),
      body: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: 0.3,
            child: new Container(
              padding: const EdgeInsets.only(top: 0.0),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/sign_in_bg.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          new Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: Center(
                  child: new Image.asset('images/logo.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                padding: const EdgeInsets.only(top: 60.0),
              ),
              new Container(
                padding: const EdgeInsets.only(left: 20.0,top: 100.0),
                width: MediaQuery.of(context).size.width * 0.96,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      controller: _usernameController,
                      decoration: new InputDecoration(
                        hintText: 'Username',
                        icon: new Icon(Icons.account_circle),
                      ),
                    ),
                    new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock_outline),
                      ),
                    ),
                    new FlatButton(
                        padding: const EdgeInsets.only(top: 80.0),
                        onPressed: () {
                          _saveLogin(_usernameController.text, _passwordController.text);
                        },
                        child: new Container(
                          height: 40.0,
                          decoration: new BoxDecoration(
                            color: Theme.of(context).accentColor,
                          ),
                          child: new Center(
                            child: new Text(
                              'Sign In',
                              style: new TextStyle(
                                color: const Color(0xff000000)
                              ),
                            ),
                          ),
                        )
                    ),
                    new Center(
                      child: new FlatButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context){
                                      return new SignUp();
                                    }
                                )
                            );
                          },
                          child: new Text("Don't have an account ?  Sign Up",
                            style: new TextStyle(
                              color: const Color(0xff000000)
                            ),
                          ),
                        padding: const EdgeInsets.only(top: 100.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}