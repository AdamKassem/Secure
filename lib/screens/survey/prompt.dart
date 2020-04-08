import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:secure/screens/survey/surveyp.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

class Prompt extends StatefulWidget {
  final Function toggleView;
  Prompt({this.toggleView});

  @override
  _PromptState createState() => new _PromptState();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _PromptState extends State<Prompt> {

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


            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),

            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
                          children: <Widget>[
                            SizedBox(
                              width: 250.0,
                              child: TypewriterAnimatedTextKit(
                                //Duration(milliseconds: 2000),
                                  onTap: () {
                                    //Duration(milliseconds: 9000);
                                    print("Tap Event");
                                  },
                                  isRepeatingAnimation: false,
                                  text: [

                                    "In order to generate potential passwords, you will need to answer a few survey questions which are estimated to take about 2 minutes. Click Next to continue",
                                    /*"Discipline is the best tool",
                                              "Design first, then code",
                                              "Do not patch bugs out, rewrite them",
                                              "Do not test bugs out, design them out",
                                              */
                                  ],
                                  textStyle: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: "Bobbers"
                                  ),
                                  textAlign: TextAlign.start,
                                  alignment: AlignmentDirectional.topCenter // or Alignment.topLeft


                              ),
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
                                              Surveyp())
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
