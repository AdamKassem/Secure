import 'package:flutter/material.dart';
import 'package:secure/screens/home/home.dart';
//import 'package:secure/screens/home/settings.dart';

class Insta extends StatefulWidget {
  final Function toggleView;
  Insta({this.toggleView});

  @override
  _Insta createState() => new _Insta();
// _MyHomePageState createState() => new _MyHomePageState();

}
class _Insta extends State<Insta> {
  // List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
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
