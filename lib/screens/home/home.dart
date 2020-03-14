import 'package:flutter/material.dart';
import 'package:secure/screens/settings/settings.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Background.jpg"),
              fit: BoxFit.cover,
            )
        ),
        constraints: BoxConstraints.expand(),
      ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Container(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.home),
                  )
                  ]
            ),
          )


    ),
//      appBar: AppBar(
//        title: Text('Secure'),
//        backgroundColor: Colors.blue[500],
//        elevation: 0.0,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () async {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => Settings()),
//              );
//            },
//          )
//        ],
//      )
    );
  }
}
