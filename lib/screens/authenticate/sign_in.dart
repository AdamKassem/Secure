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
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[500],
            appBar: AppBar(
              backgroundColor: Colors.blue[600],
              elevation: 0.0,
              title: Text('Sign into Secure'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Register'),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (val) => val.length < 6
                              ? 'Enter an passowrd 6+ chars long'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.orange[400],
                        child: Text('Sign In',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Invalid Email and/or Password';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ]),
                  ),
                )));
  }
}
