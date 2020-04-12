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
            padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 25.0),
            //padding: EdgeInsets.all(40.0),
            //margin: EdgeInsets.all(25.0),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  /*  new Center(
                    child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.purple,
                        ),
                        child: new FlutterLogo(
                          size: 200.0,
                        )
                    ),
                  );*/
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 500,
                            width: 450.0,
                            alignment: Alignment.center,
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
                              ],

                            ),

                            child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                        'images/secure4.1.jpg',
                                      ),
                                      height: 180.0,
                                      width: 300.0,
                                    ),
                                  ),
                                  //SizedBox(height: 20.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Email',
                                          prefixIcon: Icon(Icons.email)),

                                      validator: (val) => val.isEmpty ? 'Please enter an email' : null,
                                      onChanged: (val){
                                        setState(() => email = val);
                                      }
                                  ),
                                  //SizedBox(height: 40.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Password',
                                          prefixIcon: Icon(Icons.lock)),

                                      validator: (val) => val.length < 6 ? 'Please enter a passowrd 6+ chars long' : null,
                                      obscureText: true,
                                      onChanged: (val){
                                        setState(() => password = val);
                                      }
                                  ),// SIGN UP BUTTON
                                  //SizedBox(height: 20.0),
                                  RaisedButton(
                                    //color: Colors.blue[900],
                                    color: Colors.lightBlue[600],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(1000.0),
                                      side: BorderSide(color: Colors.lightBlue[600]),
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
//OR line code
                                  Column(children: <Widget>[
                                    Row(children: <Widget>[
                                      Expanded(
                                        child: new Container(
                                            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 36,
                                            )),
                                      ),
                                      Text("OR"),
                                      Expanded(
                                        child: new Container(
                                            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 36, //36
                                            )),
                                      ),
                                    ]),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[Text("Don't have an Account?")],
                                    ),
                                  ]),
                                  SizedBox(height: 24.0),
                                  RaisedButton(
                                    color: Colors.white,
                                    //color: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(1000.0),
                                      side: BorderSide(color: Colors.lightBlue[700]),
                                    ),

                                    child: Text(
                                      'Register',
                                      style: TextStyle(color: Colors.lightBlue[700]),
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
    //);
  }
}
