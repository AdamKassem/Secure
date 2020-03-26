import 'package:flutter/material.dart';
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
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
           child: Form(
              child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      //SizedBox(height: 20.0),
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
                      )
                    ]
                ),
              ),
            )
        )
    );
  }
}

