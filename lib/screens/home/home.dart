import 'package:flutter/material.dart';
import 'package:secure/screens/authenticate/sign_in.dart';
import 'package:secure/screens/home/database.dart';
import 'package:secure/screens/home/fav.dart';
import 'package:secure/screens/home/insta.dart';
import 'package:secure/screens/home/passwords.dart';
import 'package:secure/screens/settings/settings.dart';

navigateToPasswords(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Passwords()));
}
//_goSettings(context) async{
//  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//}

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
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Passwords(),
    Fav(),
    Database(),
    Insta(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Passwords(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
//    void _goSettings(){
//      Navigator.pushNamed(context, "/settings");
//    }

    return Scaffold(
      // background picture settings
      backgroundColor: Colors.transparent,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),


//      appBar: AppBar(
//        title: Text('Secure'),
//        backgroundColor: Colors.black,
//        elevation: 0.0,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => Settings()),
//              );
//            },
//          )
//        ],
//      ),

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
                          Icons.bookmark,
                          color: currentTab == 1 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Saved',
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
                          Icons. account_circle,
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
                                  leading: Icon(Icons.exit_to_app),
                                  title: Text("Sign Out"),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                  }
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



