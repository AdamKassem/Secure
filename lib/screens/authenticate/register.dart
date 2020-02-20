import 'package:flutter/material.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          elevation: 0.0,
          title: Text('Sign Up for Secure'),
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: (){
                  widget.toggleView();
                }
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                          validator: (val) => val.isEmpty ? 'Enter your first name' : null,
                          onChanged: (val){
                            setState(() => firstName = val);
                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                          validator: (val) => val.isEmpty ? 'Enter an your last name' : null,
                          onChanged: (val){
                            setState(() => lastName = val);
                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val){
                          setState(() => email = val);
                        }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6 ? 'Enter an passowrd 6+ chars long' : null,
                        obscureText: true,
                        onChanged: (val){
                          setState(() => password = val);
                        }
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.orange[400],
                        child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white)
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() => loading = true);
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if (result == null){
                              setState(() {
                                error = 'Please Supply Valid Email';
                                loading = false;
                              });
                            }else{
                              await DatabaseService(uid: result.uid).updateUserData(firstName, lastName);
                              print('User Account Created');
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ]
                ),
              ),
            )
        )
    );
  }
}
