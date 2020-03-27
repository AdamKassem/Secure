import 'package:flutter/material.dart';
import 'package:secure/screens/home/database.dart';
import 'package:secure/screens/home/fav.dart';
import 'package:secure/screens/home/insta.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
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
  var rate = 0.0;
  bool click = false;
  int clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rank Passwords'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
        ),

        // NEED TO IMPLEMENT THE REFRESH FUNCTION ***************************
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber[900],
          onPressed: () {},
          heroTag: "btn2", // tag all FABS to avoid errors continueing
        ),
        // background image
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Background.jpg'),
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
                      height: 100.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container( // contains the rest of the card
                            height: 80,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
                                  ),
                                 Container(
                                      width: 50, // length of border line
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.teal),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                    ),
                                  Row(
//                                  Padding(
//                                    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                    children: <Widget>[
                                      Container(
                                      width: 200,
                                      child: Text(
                                        "Displaying Password", style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 48, 48, 54)
                                      ),
                                      ),
                                    ),
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          onRatingChanged: (value) {
                                            setState(() {
                                              rate = value;
                                            });
                                          },
                                          starCount: 5,
                                          rating: rate,
                                          size: 20.0,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          color: Colors.yellow,
                                          borderColor: Colors.yellow,
                                          spacing:0.0
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.bookmark),
                                        color: click && clickCount % 2 == 1 ? Colors.red : Colors.grey,
                                        iconSize: 20,
                                        onPressed: () {
                                         setState(() {
                                           click = true;
                                           clickCount++;
                                         });// HOW DO YOU SEND THE CARD TO DATABASE
                                        },
                                      )
                                  ]),
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
      return "Password ${i + 1}: ";
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


