import 'package:flutter/material.dart';
import 'package:secure/screens/home/home.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Database'),
        ),

      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'),
                  fit: BoxFit.cover
              )
          ),
          constraints: BoxConstraints.expand(),
        )
    );
  }
}
