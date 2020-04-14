import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/survey/surveyp.dart';
//import 'package:secure/screens/home/settings.dart';

class Database extends StatefulWidget {
  final Function toggleView;
  Database({this.toggleView});

  @override
  _Database createState() => new _Database();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _Database extends State<Database> {
  // List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        height: 470.0,
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
                        child: Column(children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'images/secure2.png',
                              ),
                              height: 150.0,
                              width: 300.0,
                            ),
                          ),
                          //SizedBox(height: 20.0),
                          //SizedBox(width: 20.0, height: 100.0),

                          SizedBox(
                            width: 250.0,
                            child: FadeAnimatedTextKit(
                                duration: Duration(milliseconds: 4000),
                                pause: Duration(milliseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                                onTap: () {
                                  print("Tap Event");
                                },
                                text: [
                                  "Welcome to Secure!",
                                  "Please fill out the following survey in order to generate potential passwords. Click Next to proceed."
                                ],
                                isRepeatingAnimation: true,
                                textStyle: TextStyle(
                                  color: Colors.lightBlue[600],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Bobbers",
                                ),
                                textAlign: TextAlign.center,
                                alignment: AlignmentDirectional
                                    .topCenter // or Alignment.topLeft
                                ),
                          ),
                          RaisedButton(
                              color: Colors.lightBlue[600],
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(1000.0),
                                  side: BorderSide(color: Colors.lightBlue[600])),
                              child: Text('Next',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Surveyp()));
                              }),
                        ]))
                  ]))),
    );
  }
}
