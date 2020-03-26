import 'package:flutter/material.dart';
import 'package:secure/screens/home/database.dart';
import 'package:secure/screens/home/fav.dart';
import 'package:secure/screens/home/insta.dart';
import 'package:secure/screens/settings/settings.dart';

class Passwords extends StatefulWidget {
  final Function toggleView;
  Passwords({this.toggleView});

  @override
  _PasswordsState createState() => new _PasswordsState();

}
class _PasswordsState extends State<Passwords> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top 5 passwords'),
        ),
      // background picture settings
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


/*
navigateToFav(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Fav()));
}

navigateToDatabase(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Database()));
}

navigateToInsta(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Insta()));
}
*/
