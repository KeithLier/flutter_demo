import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'promptPage.dart';
class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SignUpState();
  }
}


class SignUpState extends State<SignUp> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  String _correctUsername = '';
  String _correctPassword = '';

  final refrence = FirebaseDatabase.instance.reference().child('users');

  PromptPage promptPage = new PromptPage();
  void _handleSubmitted() async {
    if (_usernameController.text == '' || _passwordController.text == '') {
      await promptPage.showMessage(
          context, "title", "Username or password cannot be empty!");
      return;
    } else if (_correctUsername.isNotEmpty || _correctPassword.isNotEmpty) {
      await promptPage.showMessage(
          context, "title", "Username or password format is incorrect!");
      return;
    }
    _userLogUp(_usernameController.text, _passwordController.text,email: _emailController.text,phone: _passwordController.text);
  }
  void _userLogUp(String username, String password, {String email, String phone}) {
      refrence.push().set({
        'name':username,
        'password':password,
        'email':email,
        'phone':phone
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up'),
        backgroundColor: Colors.grey[200],
      ),
      body: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: 0.3,
            child: new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image:new ExactAssetImage('images/sign_up_bg.jpg'),
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
                child: new Center(
                  child:new Image.asset('images/logo.png',width: MediaQuery.of(context).size.width * 0.2,),
                ),
                padding: const EdgeInsets.only(top: 60.0),
              ),
              new Container(
                padding: const EdgeInsets.only(left: 20.0,top: 80.0),
                width: MediaQuery.of(context).size.width *0.96,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      controller: _usernameController,
                      decoration: new InputDecoration(
                        hintText: 'Username',
                        errorText: (_correctUsername == "") ? null : _correctUsername,
                        icon: new Icon(Icons.account_circle),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if(value.isEmpty) {
                            _correctUsername = 'Username can not be empty';
                          } else if (value.trim().length < 3) {
                            _correctUsername = 'Username length is less than 3 bit';
                          } else {
                            _correctUsername = '';
                          }
                        });
                      },
                    ),
                    new TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        errorText: (_correctPassword == "") ? null : _correctPassword,
                        icon: new Icon(Icons.lock_outline),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if(value.isEmpty) {
                            _correctPassword = 'Password can not be empty';
                          } else if (value.trim().length < 6) {
                            _correctPassword = 'Password length is less than 6 bit';
                          } else {
                            _correctPassword = '';
                          }
                        });
                      },
                    ),
                    new TextField(
                      maxLengthEnforced: false,
                      maxLines: null,
                      controller: _emailController,
                      decoration: new InputDecoration(
                        hintText: 'Email',
                        icon: new Icon(Icons.email),
                      ),
                    ),
                    new TextField(
                      maxLengthEnforced: false,
                      maxLines: null,
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: 'Phone',
                        icon: new Icon(Icons.phone),
                      ),
                    ),
                    new Center(
                      child: new FlatButton(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: new Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: new BoxDecoration(
                            color: Theme.of(context).accentColor,
                          ),
                          child: new Center(
                              child: new Text("Join",
                                  style: new TextStyle(
                                    color: const Color(0xff000000),
                                  ))),
                        ),
                        onPressed: () {
                          _handleSubmitted();
                        },
                      ),
                    ),

                    new Center(
                        child: new FlatButton(
                          child: new Text("Already have an account ?  Sign In",
                              style: new TextStyle(
                                color: const Color(0xff000000),
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.only(top: 100.0),
                        )
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