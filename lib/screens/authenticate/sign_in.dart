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
                        image: AssetImage("images/Background.jpg"),
                        fit: BoxFit.cover,
                      )
                  ),
                  constraints: BoxConstraints.expand(),
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child:
                  Form(
                    key: _formKey,
                    child:
                    SingleChildScrollView(
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 200.0),
                            TextFormField(
                              //decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                decoration: new InputDecoration(
                                  labelText: "Email",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(30.0),
                                    borderSide: new BorderSide(color: Colors.pink, width: 2.0),

                                  ),
                                ),
                                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val){
                                  setState(() => email = val);
                                }
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              //decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                decoration: new InputDecoration(
                                    labelText: "Password",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(30.0),
                                      borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                                    )
                                ),
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
                            SizedBox(height: 20.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            SizedBox(height: 20.0),
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
                  )
              )
          );
  }
}
