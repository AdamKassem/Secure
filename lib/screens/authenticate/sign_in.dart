import 'package:flutter/material.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading():
    Scaffold(
        backgroundColor: Colors.transparent,
        body:
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.jpg"),
                  fit: BoxFit.cover,
                )
            ),
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
            child:
            Form(
                key: _formKey,
                child:
                SingleChildScrollView(
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: (500),
                            width: 450.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: new BorderRadius.all (
                                    Radius.circular(40.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 1.5,
                                  ),
                                ]
                            ),

                            child: Column(
                                children: <Widget>[
                                  SizedBox(height: 200.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Email'),

                                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val){
                                        setState(() => email = val);
                                      }
                                  ),
                                  SizedBox(height: 40.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Password'),

                                      validator: (val) => val.length < 6 ? 'Enter an passowrd 6+ chars long' : null,
                                      obscureText: true,
                                      onChanged: (val){
                                        setState(() => password = val);
                                      }
                                  ),// SIGN UP BUTTON
                                  SizedBox(height: 20.0),
                                  RaisedButton(
                                    color: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(1000.0),
                                      side: BorderSide(color: Colors.blue[900]),
                                    ),

                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if(_formKey.currentState.validate()){
                                        setState(() => loading = true);
                                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                        if (result == null){
                                          setState(() {
                                            error = 'Invalid Email and/or Password';
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                  //SizedBox(height: 20.0),
                                  Text(
                                    error,
                                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                                  ),

                                  RaisedButton(
                                    color: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(1000.0),
                                      side: BorderSide(color: Colors.blue[900]),
                                    ),

                                    child: Text(
                                      'Register',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      widget.toggleView();
                                    },
                                  ),
                                ]
                            ),
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}


