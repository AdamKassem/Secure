import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/screens/survey/surpb.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

class Surveyp extends StatefulWidget {
  final Function toggleView;
  Surveyp({this.toggleView});

  @override
  _Surveyp createState() => new _Surveyp();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _Surveyp extends State<Surveyp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String Qone = '';
  String Qtwo = '';
  String Qthree = '';
  String Qfour = '';
  String Qfive = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Container(
                            height: 600.0,
                            width: 450.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(40.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  //child: Column(
                                  // children: <Widget>[
                                  SizedBox(height: 30.0),
/*
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text("1. What city were you born in?",
                                                          style: TextStyle(
                                                            color: Colors.lightBlue[600],
                                                            fontSize: 15.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: "Bobbers",
                                                          ),
                      ),
                    ]
                                                      ),
*/
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '   1. What city were you born in?',
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),

                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '       Answer Question 1',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      //focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qone = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 30.0),

                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '   2. Where is your favorite vacation spot?',
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),

                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '       Answer Question 2',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please Enter your answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qtwo = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),

                                  //SizedBox(height: 30.0),

                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '   3. What is your mother’s maiden name?',
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),

                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '       Answer Question 3',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qthree = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 30.0),

                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '   4. What is the name of your favorite teacher?',
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '       Answer Question 4',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please Enter your answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qfour = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),

                                  //SizedBox(height: 30.0),

                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '   5. What is the name of your favorite television show/movie character?',
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 5',
                                      contentPadding: EdgeInsets.symmetric(vertical: -30),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qfive = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 15.0),
                                  RaisedButton(
                                      color: Colors.lightBlue[600],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(1000.0),
                                          side: BorderSide(
                                              color: Colors.lightBlue[600])),
                                      child: Text('Continue',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () async {
                                        DocumentReference docRef = Firestore
                                            .instance
                                            .collection('userData')
                                            .document(user.uid);
                                        DocumentSnapshot doc =
                                            await docRef.get();
                                        List items = doc.data['responses'];
                                        List answers = [
                                          Qone.toLowerCase(),
                                          Qtwo.toLowerCase(),
                                          Qthree.toLowerCase(),
                                          Qfour.toLowerCase(),
                                          Qfive.toLowerCase()
                                        ];
                                        docRef.updateData({
                                          'responses':
                                              FieldValue.arrayUnion(answers)
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Surpb()) // to survey page b
                                            );
                                      }),
                                  //SizedBox(height: 15.0),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0),
                                  ),
                                ])
                            //

                            )
                      ]))))),
    );
  }
}
