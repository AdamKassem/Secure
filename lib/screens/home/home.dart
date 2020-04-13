import 'package:flutter/material.dart';
import 'package:secure/screens/home/database.dart';
import 'package:secure/screens/home/fav.dart';
import 'package:secure/screens/home/profile.dart';
import 'package:secure/screens/home/passwords.dart';
import 'package:secure/screens/settings/settings.dart';
import 'package:secure/services/auth.dart';

navigateToPasswords(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Passwords()));
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

class Home extends StatefulWidget {
  final Function toggleView;

  Home({this.toggleView});

  @override
  _HomeState createState() => new _HomeState();

}
class _HomeState extends State<Home>{
  int currentTab = 1; // to keep track of active tab index
  final List<Widget> screens = [
    Passwords(),
    Fav(),
    Database(),
    Insta(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Database(); // Our first view in viewport

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background picture settings
      backgroundColor: Colors.transparent,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      /*body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
            )
            ),
            constraints: BoxConstraints.expand(),
            ),*/

      // get rid of this and add the card view
      /*
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
      */
//Home button code
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        foregroundColor: Colors.white,
        backgroundColor: Colors.amber[900],
        heroTag: "btn1",
        onPressed: () {
          navigateToPasswords(context);
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Only 4 bottom app bar icons code
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.indigo[900],
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      //navigateToFav(context);
                      setState(() {
                        currentScreen = Fav(); // if user taps on this fav tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: currentTab == 0 ? Colors.yellow : Colors.grey,
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      //navigateToDatabase(context);
                      setState(() {
                        currentScreen = Database(); // if user taps on this database tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dvr,
                          color: currentTab == 1 ? Colors.lightBlueAccent : Colors.grey,
                        ),
                        Text(
                          'Survey',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // End Left of Home icon buttons

              // Start Right of Home Icon buttons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      //navigateToInsta(context);
                      setState(() {
                        currentScreen = Insta(); // if user taps on this instagram page tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.center_focus_weak,
                          color: currentTab == 2 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    //onPressed: (){
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Drawer(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text("Sign Out"),
                                  onTap: () async {
                                    await _auth.signOut();
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            )
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.menu,
                          color: currentTab == 3 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.white : Colors.grey,

                          ),
                        ),
                      ],
                    ),

                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:secure/screens/settings/settings.dart';
import 'package:secure/screens/home/fav.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text('Secure'),
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          SizedBox(height: 15.0),
          RaisedButton(
              color: Colors.indigo[700],
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius
                      .circular(1000.0),
                  side: BorderSide(
                      color: Colors.indigo[700])
              ),
              child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white)
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Fav())
                );
              }
          ),
        ],
      )
    );
  }
}
*/

/*class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
          shape: CircularNotchedRectangle(),
          color: Colors.blue[200],
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.star),
                  color: Colors.white,
                  onPressed: () {
                    navigateToFav(context);
                    // favorite page
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
//                                onTap:
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
*/