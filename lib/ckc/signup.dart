import 'package:flutter/material.dart';

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
                    new TextField(
                      controller: _emailController,
                      decoration: new InputDecoration(
                        hintText: 'Email',
                        icon: new Icon(Icons.email),
                      ),
                    ),
                    new TextField(
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
                          print('Sign In');
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