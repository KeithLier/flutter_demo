import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: 0.3,
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/sign_in_bg.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Center(
                child: new Image.asset('images/logo.png',width: MediaQuery.of(context).size.width * 0.3,),
              ),
              new Container(
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
                        onPressed: () {
                          
                        },
                        child: new Container(
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
                            
                          },
                          child: new Text("Don't have an account ?  Sign Up",
                            style: new TextStyle(
                              color: const Color(0xff000000)
                            ),
                          )
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