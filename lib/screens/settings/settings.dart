import 'package:flutter/material.dart';
import 'package:secure/screens/survey_questions/childhood_questions.dart';
import 'package:secure/services/auth.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
          title: Text('Secure Settings'),
          backgroundColor: Colors.blue[500],
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(height: 15.0),
                  FlatButton(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 15.0),
                  FlatButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildHoodQuestions()),
                      );
                    },
                    child: Text(
                      'Edit Survey Questions',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    textColor: Colors.white,
                  ),
                ]),
              ),
            )));
  }
}
