import 'package:flutter/material.dart';
import 'package:secure/screens/settings/settings.dart';


navigateToHome(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // background picture settings
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

        // get rid of this and add the card view
        appBar: AppBar(
          title: Text('Secure'),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             navigateToHome(context);
          },
          child: Icon(Icons.home),
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber[900],
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.star),
                  color: Colors.white,
                  onPressed: () { // redirect to favorited page
                     },
                ),
                IconButton(
                  icon: Icon(Icons.folder),
                  color: Colors.white,
                  onPressed: () {},
                  // redirect to database page
                ),
                IconButton(
                  icon: Icon(Icons.center_focus_weak),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Drawer(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Sign Out"),
                                onTap:  
                              )
                            ],
                          )
                      )
                  ),
                ),

              ]
          )
        ),
    );
  }
}



