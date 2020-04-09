import 'package:flutter/material.dart';
import 'package:secure/screens/home/database.dart';
import 'package:secure/screens/home/fav.dart';
import 'package:secure/screens/home/insta.dart';
import 'package:secure/screens/settings/settings.dart';

// this is basically the home page...
// shows the top five passwords

class Passwords extends StatefulWidget {
  final Function toggleView;
  Passwords({this.toggleView});
  @override
  _PasswordsState createState() => new _PasswordsState();
}


class _PasswordsState extends State<Passwords> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text('Rank Passwords'),
        title: const Text('Rank Passwords', style: TextStyle(
          color: Colors.indigo)),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[200],
          elevation: 0.0,
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber[900],
          onPressed: () {},
          heroTag: "btn2",
        ),
        // background image
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
            constraints: BoxConstraints.expand(),

            // creates the array to hold the number of each card
            // listview calls the function
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card( // what the listview returns
                    elevation: 20,
                    child: Container(
                      height: 75.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container( // contains the logo
                            height: 75.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage('images/secure4.1.jpg'),
                                )
                            ),
                          ),

                          Container( // contains the rest of the card
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    child: Container(
                                      width: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.teal),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                    child: Container(
                                      width: 250,
                                      child: Text(
                                        "Displaying Password", style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 48, 48, 54)
                                      ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
        )
    );
  }

  static List getDummyList() {
    List list = List.generate(5, (i) {
      return "Password ${i + 1}";
    });
    return list;
  }
}

navigateToFav(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Fav()));
}
navigateToDatabase(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Database()));
}
navigateToInsta(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Insta()));
}



/*
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
*/