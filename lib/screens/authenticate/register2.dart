//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:secure/screens/survey/prompt.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';


class Register2 extends StatefulWidget {

  final Function toggleView;
  Register2({this.toggleView});

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmP  = '';
  String error = '';

  @override
  Widget build(BuildContext context) {



    return loading ? Loading() : Scaffold(

        body: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'),
                  fit: BoxFit.cover
              )
          ),
          constraints: BoxConstraints.expand(),

          padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 25.0),


          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          height: 500.0,
                          width: 450.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.all (Radius.circular(40.0)),
                              boxShadow: [
                                BoxShadow (
                                  color:Colors.grey[500],
                                  offset: Offset(0.0, 1.5),
                                  blurRadius: 1.5,
                                ),
                              ]
                          ),
                          child: Column(
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'images/secure2.png',
                                    ),
                                    height: 180.0,
                                    width: 300.0,
                                  ),
                                ),

                                //SizedBox(height: 70.0),
                                TextFormField(
                                    decoration: textInputDecoration.copyWith(hintText: 'Email',
                                        prefixIcon: Icon(Icons.email)),

                                    validator: (val) => val.isEmpty ? 'Please enter your Email Address' : null,
                                    onChanged: (val){
                                      setState(() => email = val);
                                    },

                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Raleway",
                                    )
                                ),
                                //SizedBox(height: 30.0),
                                TextFormField(
                                    decoration: textInputDecoration.copyWith(hintText: 'Password',
                                        prefixIcon: Icon(Icons.lock)),

                                    validator: (val) => val.length < 6 ? 'Please enter a passowrd 6+ chars long' : null,
                                    obscureText: true,
                                    onChanged: (val){
                                      setState(() => password = val);
                                    },

                                   keyboardType: TextInputType.visiblePassword,
                                    //obscureText: true,
                                    style: new TextStyle(
                                      fontFamily: "Raleway",
                                    )

                                ),
                                //SizedBox(height: 30.0),
                                TextFormField(
                                    decoration: textInputDecoration.copyWith(hintText: 'Confirm Password',
                                        prefixIcon: Icon(Icons.lock)),

                                    validator: (val){
                                      if(val.isEmpty)
                                        return 'Please Confirm your Password';
                                      if(val != password)
                                        return 'Please make sure your passwords match';
                                      return null;
                                    },
                                    //validator: (val) => val ! = val ? 'Please enter an passowrd 6+ chars long' : null,
                                    obscureText: true,
                                    onChanged: (val){
                                      setState(() => confirmP = val);
                                    },

                                    keyboardType: TextInputType.visiblePassword,
                                    //obscureText: true,
                                    style: new TextStyle(
                                      fontFamily: "Raleway",
                                    )
                                ),
                                //SizedBox(height: 15.0),
                                RaisedButton(

                                  //color: Colors.indigo[700],
                                  color: Colors.lightBlue[600],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(1000.0),
                                      side: BorderSide(color: Colors.lightBlue[600])
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
                                //SizedBox(height: 15.0),

                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                                ),
                                RaisedButton(

                                    color: Colors.indigo[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(1000.0),
                                        side: BorderSide(color: Colors.indigo[700])
                                    ),
                                    child: Text(
                                        'Survey',
                                        style: TextStyle(color: Colors.white)
                                    ),
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Prompt())
                                      );
                                    }
                                )
                              ]
                          )
                      ),
                    ]
                )
            ),
          ),
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

