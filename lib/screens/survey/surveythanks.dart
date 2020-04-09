
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/survey/surveyp.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

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
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
            constraints: BoxConstraints.expand(),


            padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 25.0),

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      height: 500.0,
                      width: 450.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.all (
                              Radius.circular(40.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(0.0, 1.5),
                              blurRadius: 1.5,
                            ),
                          ]
                      ),

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 100,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2500,
                                percent: 1.0,
                                center: Text("100.0%"),
                                linearStrokeCap: LinearStrokeCap.roundAll,
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
                                  duration: Duration(milliseconds: 2000),
                                  //pause: Duration(milliseconds:  5000),
                                  displayFullTextOnTap: true,
                                  //stopPauseOnTap: true,
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                  text: [
                                    "Thank you for taking our Survey!",
                                    "Click Finish to access your Profile.",
                                  ],
                                  // isRepeatingAnimation: false,

                                  textStyle: TextStyle(
                                    color: Colors.lightBlue[600],
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Bobbers",
                                  ),
                                  textAlign: TextAlign.center,
                                  alignment: AlignmentDirectional.topCenter // or Alignment.topLeft
                              ),
                            ),

                            //SizedBox(height: 20.0),
                            RaisedButton(
                                color: Colors.lightBlue[600],
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius
                                        .circular(1000.0),
                                    side: BorderSide(
                                        color: Colors.lightBlue[600])
                                ),
                                child: Text(
                                    'Finish',
                                    style: TextStyle(
                                        color: Colors.white)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          Home())
                                  );
                                }
                            ),
                          ]

                      )
                  )
                ]
            )
        )
    );
  }
}
