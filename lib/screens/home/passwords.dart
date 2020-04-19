import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/models/user_data.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/home/profile.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/loading.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:universal_html/driver.dart';
import 'dart:math';
import 'database.dart';
import 'fav.dart';
//import 'package:secure/screens/home/settings.dart';

// this is basically the home page...
// shows the top five passwords

class Passwords extends StatefulWidget {
  final Function toggleView;
  Passwords({this.toggleView});
  @override
  _PasswordsState createState() => new _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  List passwords = new List();
  bool click = false;
  int clickCount = 0;
  String read = '';
  List rate = [0.0, 0.0, 0.0, 0.0, 0.0];
  bool rating = false;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return SafeArea(
      child: Scaffold(

          // NEED TO IMPLEMENT THE REFRESH FUNCTION ***************************
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber[900],
            onPressed: () {
              DocumentReference docRef =
                  Firestore.instance.collection('userData').document(user.uid);
              docRef.updateData({'trigger': FieldValue.increment(1)});
              for (var x = 0; x < 5; x++) {
                if (rate[x] > 0.0) {
                  String s = rate[x].toInt().toString() + passwords[x];
                  docRef.updateData({
                    'passwords': FieldValue.arrayUnion([s])
                  });
                }
              }
              rating = false;
              rate = [0.0, 0.0, 0.0, 0.0, 0.0];
            },
            heroTag: "btn2", // tag all FABS to avoid errors continueing
          ),
          // background image
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              // creates the array to hold the number of each card
              // listview calls the function
              child: StreamBuilder(
                  stream: DatabaseService(uid: user.uid).userInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // GENERATE USER PASSWORDS
                      UserData userData = snapshot.data;
                      List items = userData.responses;
                      if (!rating && items.length > 0) {
                        // Grab 3 random words
                        var ran = new Random();
                        passwords = new List();
                        while (passwords.length < 5) {
                          List temp = new List();
                          while (temp.length < 2) {
                            var ind = ran.nextInt(items.length);
                            String t = items[ind];
                            t = t.replaceAll(' ', '');
                            if (temp.contains(t)) {
                              continue;
                            }
                            if (read.contains(t.toString().toLowerCase())) {
                              // Remove if in database
                              DocumentReference docRef = Firestore.instance
                                  .collection('userData')
                                  .document(user.uid);
                              print(t);
                              docRef.updateData({
                                'responses': FieldValue.arrayRemove([t])
                              });
                              items.removeAt(ind);
                              continue;
                            }
                            temp.add(t);
                          }
                          String pass = '';
                          pass = generatePass(temp);
                          passwords.add(pass);
                        }
                      }
                      if (items.length == 0) {
                        passwords.add('Fill out the survey!');
                      }
                      return ListView.builder(
                          itemCount: passwords.length,
                          itemBuilder: (context, index) {
                            String PassNum =
                                'Password ' + (index + 1).toString();
                            return new Card(
                              // what the list view returns
                              elevation: 20,
                              child: Container(
                                height: 100.0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      // contains the rest of the card
                                      height: 80,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              PassNum,
                                            ),
                                            Container(
                                              //padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                              width:
                                                  90, // length of border line
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.teal),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 12, 0, 0),
                                              child: Row(
//                                  Padding(
//                                     padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                                  children: <Widget>[
                                                    Container(
                                                      width: 200,
                                                      child: Text(
                                                        passwords[index],
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    48,
                                                                    48,
                                                                    54)),
                                                      ),
                                                    ),
                                                    SmoothStarRating(
                                                        allowHalfRating: false,
                                                        onRatingChanged:
                                                            (value) {
                                                          setState(() {
                                                            rate[index] = value;
                                                            rating = true;
                                                          });
                                                        },
                                                        starCount: 5,
                                                        rating: rate[index],
                                                        size: 20.0,
                                                        filledIconData:
                                                            Icons.star,
                                                        halfFilledIconData:
                                                            Icons.star_half,
                                                        defaultIconData:
                                                            Icons.star_border,
                                                        color: Colors.blue,
                                                        borderColor:
                                                            Colors.blue,
                                                        spacing: 0.0),
                                                    /*IconButton(
                                                icon: Icon(Icons.bookmark),
                                                color: click && clickCount % 2 == 1 ? Colors.red : Colors.grey,
                                                iconSize: 20,
                                                onPressed: () {
                                                  setState(() {
                                                    click = true;
                                                    clickCount++;
                                                  });// HOW DO YOU SEND THE CARD TO DATABASE
                                                },
                                              )*/
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Loading();
                    }
                  }))),
    );
  }

  String generatePass(List keys) {
    String s1 = keys[0];
    String s2 = keys[1];
    String fin = '';
    List special = ['{}', '<>', '.', '!', '@', '()', '&', '?', ':', '[]', '-'];
    var ran = new Random();
    special.add(ran.nextInt(10).toString());
    special.add(ran.nextInt(100).toString());
    special.add(ran.nextInt(100).toString());
    special.add(ran.nextInt(100).toString());
    var rand = ran.nextInt(100);
    for (int i = 0; i < s1.length; i++) {
      String curr = s1[i].toString();
      rand = ran.nextInt(10);
      if (rand == 2) {
        curr = curr.toUpperCase();
      }
      rand = ran.nextInt(25);
      if (rand == 2) {
        curr = '';
      }
      fin += curr;
    }
    rand = ran.nextInt(2);
    for (int i = 0; i < rand; i++) {
      var ind = ran.nextInt(special.length);
      fin += special[ind];
    }
    for (int i = 0; i < s2.length; i++) {
      String curr = s2[i].toString();
      rand = ran.nextInt(10);
      if (rand == 2) {
        curr = curr.toUpperCase();
      }
      rand = ran.nextInt(25);
      if (rand == 2) {
        curr = '';
      }
      fin += curr;
    }
    rand = ran.nextInt(4);
    for (int i = 0; i < rand; i++) {
      var ind = ran.nextInt(special.length);
      fin += special[ind];
    }

    return fin;
  }
}

navigateToFav(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Fav()));
}

navigateToDatabase(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Database()));
}

navigateToInsta(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Insta()));
}
