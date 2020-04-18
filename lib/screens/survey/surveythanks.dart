import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/models/user_data.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/survey/surveyp.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';
import 'package:universal_html/driver.dart';

class Surveythanks extends StatefulWidget {
  final Function toggleView;
  Surveythanks({this.toggleView});

  @override
  _SurveythanksState createState() => new _SurveythanksState();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _SurveythanksState extends State<Surveythanks> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return SafeArea(
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userInfo,
          builder: (context, snapshotDatabase) {
            if (snapshotDatabase.hasData) {
              UserData userData = snapshotDatabase.data;
              return FutureBuilder<String>(
                  future: reader(
                      userData.firstName,
                      userData
                          .lastName), // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      String data = snapshot.data;
                      List responses = userData.responses;
                      DocumentReference docRef = Firestore.instance
                          .collection('userData')
                          .document(user.uid);
                      for (String s in responses) {
                        if (data.contains(s)) {
                          print("Bad response: " + s);
                          docRef.updateData({
                            'responses': FieldValue.arrayRemove([s])
                          });
                        }
                      }
                      return Scaffold(
                          body: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/bg.jpg'),
                                      fit: BoxFit.cover)),
                              constraints: BoxConstraints.expand(),
                              padding: EdgeInsets.fromLTRB(25, 45, 25, 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                        height: 425.0,
                                        width: 450.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(40.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[500],
                                                offset: Offset(0.0, 1.5),
                                                blurRadius: 1.5,
                                              ),
                                            ]),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child:
                                                    new LinearPercentIndicator(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  animation: true,
                                                  lineHeight: 20.0,
                                                  animationDuration: 2500,
                                                  percent: 1.0,
                                                  center: Text("100.0%"),
                                                  linearStrokeCap:
                                                      LinearStrokeCap.roundAll,
                                                  progressColor: Colors.blue,
                                                ),
                                              ),

                                              Center(
                                                child: Image(
                                                  image: AssetImage(
                                                    'images/secure2.png',
                                                  ),
                                                  height: 150.0,
                                                  width: 300.0,
                                                ),
                                              ),
                                              //SizedBox(height: 20.0),
                                              //SizedBox(width: 20.0, height: 100.0),
                                              /*SizedBox(
                                          width: 250.0,
                                          child: TypewriterAnimatedTextKit(
                                            //Duration(milliseconds: 2000),
                                              onTap: () {
                                                //Duration(milliseconds: 10);
                                                print("Tap Event");
                                              },

                                              text: [
                                                "Thank you for taking our Survey! Click Finish to access your Profile.",

                                                /* "Click Next to continue",
                                                         // "In order to generate potential passwords, you will need to answer a few survey
                                                          // questions which are estimated to take about 2 minutes. Click Next to continue",
                                                          "Discipline is the best tool",
                                                          "Design first, then code",
                                                          "Do not patch bugs out, rewrite them",
                                                          "Do not test bugs out, design them out",
                                                          */
                                              ],
                                              isRepeatingAnimation: false,

                                              textStyle: TextStyle(
                                                color: Colors.lightBlue[600],
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Bobbers",
                                              ),


                                              textAlign: TextAlign.start,
                                              alignment: AlignmentDirectional.topCenter // or Alignment.topLeft


                                          ),
                                        ),*/

                                              SizedBox(
                                                width: 250.0,
                                                child: FadeAnimatedTextKit(
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    pause: Duration(
                                                        milliseconds: 1000),
                                                    displayFullTextOnTap: true,
                                                    //stopPauseOnTap: true,
                                                    onTap: () {
                                                      print("Tap Event");
                                                    },
                                                    text: [
                                                      "Thank you for taking our Survey!",
                                                      "Click Finish to return to survey page.",
                                                    ],
                                                    isRepeatingAnimation: true,
                                                    textStyle: TextStyle(
                                                      color:
                                                          Colors.lightBlue[600],
                                                      fontSize: 30.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "Bobbers",
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    alignment: AlignmentDirectional
                                                        .topCenter // or Alignment.topLeft
                                                    ),
                                              ),

                                              //SizedBox(height: 20.0),
                                              RaisedButton(
                                                  color: Colors.lightBlue[600],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(1000.0),
                                                      side: BorderSide(
                                                          color: Colors
                                                              .lightBlue[600])),
                                                  child: Text('Finish',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  }),
                                            ]))
                                  ])));
                    } else {
                      return Loading();
                    }
                  });
            } else {
              return Loading();
            }
          }),
    );
  }

  Future<String> reader(String firstName, String lastName) async {
    // Construct a browser simulator.
    final driver = new HtmlDriver();

    // Get webpage to parse
    String webpage =
        "https://publicrecords.searchsystems.net/search-result.php?fname=" +
            firstName.toLowerCase() +
            "&lname=" +
            lastName.toLowerCase() +
            "&state=";

    // Open a web page.
    await driver.setDocumentFromUri(Uri.parse(webpage));

    // Put all html data into query
    final data = driver.document.querySelectorAll("*");

    // Put all into one string
    String read = data.toString();
    read = read.toLowerCase();
    return read;
  }
}
