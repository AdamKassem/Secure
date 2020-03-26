//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:secure/screens/authenticate/register2.dart';
import 'package:secure/screens/survey/prompt.dart';
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
  String confirmP = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(

      //backgroundColor: Colors.lightBlue[50], //Colors.grey[900],
      /*
        appBar: AppBar(
          backgroundColor: Colors.indigo[700],
          elevation: 0.0,
          title: Text('New User? Create an Account'),
          centerTitle: true,
          /* Code to view Sign in button on top right hand corner on sign up page
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: (){
                  widget.toggleView();
                }
            )
          ],*/
        ),*/



        body: Container(

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
            constraints: BoxConstraints.expand(),

            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),


            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                              height: 350.0,
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
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'First Name'),
                                      /*decoration: new InputDecoration(
                              labelText:"First Name",
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                //borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                              )
                              ),
*/
                                      validator: (val) =>
                                      val.isEmpty
                                          ? 'Enter your First Name'
                                          : null,
                                      onChanged: (val) {
                                        setState(() => firstName = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Last Name'),
                                      /*decoration: new InputDecoration(
                                    labelText:"Last Name",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                      //borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                                    )*/


                                    validator: (val) => val.isEmpty ? 'Enter your Last Name' : null,
                                    onChanged: (val) {
                                      setState(() => lastName = val);
                                    },

                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                    ),

                                    SizedBox(height: 15.0),
                                    RaisedButton(

                                        color: Colors.indigo[700],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius
                                                .circular(1000.0),
                                            side: BorderSide(
                                                color: Colors.indigo[700])
                                        ),
                                        child: Text(
                                            'Next',
                                            style: TextStyle(
                                                color: Colors.white)
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register2())
                                          );
                                        }
                                    ),
                                    SizedBox(height: 15.0),
                                    Text(
                                      error,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14.0),
                                    ),

                                  ]
                              )
                          ),
                        ]
                    )
                )
            )
        )

    );
  }
}


/*
                      SizedBox(height: 30.0),
                      TextFormField(
                          //decoration: textInputDecoration.copyWith(hintText: 'First Name',
                          decoration: new InputDecoration(
                            labelText:"First Name",
                            fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                //borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                          )
                          ),

                          validator: (val) => val.isEmpty ? 'Enter your First Name' : null,
                          onChanged: (val){
                            setState(() => firstName = val);
                          },

                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          )

                        /*

                          validator: (val) {
                            if (val.length==0){
                              return "First name cannot be empty";
                            }else {
                              return null;
                            }
                          },

                          */
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(

                          decoration: new InputDecoration(
                              labelText: "Last Name",
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                              )
                          ),

                          validator: (val) => val.isEmpty ? 'Enter your Last Name' : null,
                          onChanged: (val){
                            setState(() => lastName = val);
                          },

                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          )
                          /*
                          decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                          validator: (val) => val.isEmpty ? 'Enter an your last name' : null,
                          onChanged: (val){
                            setState(() => lastName = val);
                          }*/
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Email",
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                              )
                          ),

                          validator: (val) => val.isEmpty ? 'Enter your Email address' : null,
                          onChanged: (val){
                            setState(() => email = val);
                          },

                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Raleway",
                          )
                   /*
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val){
                          setState(() => email = val);
                        }*/
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(

                          decoration: new InputDecoration(
                              labelText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                              )
                          ),

                          validator: (val) => val.isEmpty ? 'Enter a valid password' : null,
                          onChanged: (val){
                            setState(() => password = val);
                          },

                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          )

                       /* decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6 ? 'Enter an passowrd 6+ chars long' : null,
                        obscureText: true,
                        onChanged: (val){
                          setState(() => password = val);
                        }*/
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Confirm Password",
                              fillColor: Colors.white,
                              filled: true,
                              border: new OutlineInputBorder(borderRadius: new BorderRadius.circular (35.0),
                                borderSide: new BorderSide(color: Colors.pink, width: 2.0),
                              )
                          ),

                          validator: (val) => val.isEmpty ? 'Confirm Password' : null,
                          onChanged: (val){
                            setState(() => confirmP = val);
                          },

                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          )

                       /*
                          decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                          validator: (val) => val.isEmpty ? 'Confirm your Password' : null,
                          onChanged: (val){
                            setState(() => confirmP = val);
                          }*/
                      ),
                      SizedBox(height: 15.0),


                      RaisedButton(
                        color: Colors.indigo[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(1000.0),
                            side: BorderSide(color: Colors.indigo[700])
                        ),
                        child: Text(
                            'Sign Up',
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
                      SizedBox(height: 15.0),

                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      */