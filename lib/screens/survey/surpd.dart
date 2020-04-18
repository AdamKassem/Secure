import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/survey/surveythanks.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

class Surpd extends StatefulWidget {
  final Function toggleView;
  Surpd({this.toggleView});

  @override
  _Surpd createState() => new _Surpd();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _Surpd extends State<Surpd> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String Qsteen = '';
  String Qseteen = '';
  String Qeteen = '';
  String Qnteen = '';
  String Qtwenty = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Container(
                            height: 600.0,
                            width: 450.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(40.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[500],
                                    offset: Offset(0.0, 1.5),
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: new LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      animation: true,
                                      lineHeight: 20.0,
                                      animationDuration: 2500,
                                      percent: 0.75,
                                      center: Text("75.0%"),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: Colors.blue,
                                    ),
                                  ),

                                  //child: Column(
                                  // children: <Widget>[
                                  //SizedBox(height: 30.0),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "   16. What’s the name of the primary school you attended?",
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 16',
                                      contentPadding: EdgeInsets.symmetric(vertical: -30),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qsteen = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 30.0),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "   17. What is your desired job?",
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 17',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please Enter your answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qseteen = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),

                                  //SizedBox(height: 30.0),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "   18. Which city or town did your parents meet in?",
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 18',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qeteen = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 30.0),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "   19. What is the name of your first stuffed animal?",
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 19',
                                      contentPadding: EdgeInsets.symmetric(vertical: -45),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please Enter your answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qnteen = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),

                                  //SizedBox(height: 30.0),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "   20. What is the middle name of a close family member?",
                                                style: TextStyle(
                                                  color: Colors.lightBlue[600],
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Bobbers",
                                                ),
                                              ))
                                        ]),
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                      hintText: '         Answer Question 20',
                                      contentPadding: EdgeInsets.symmetric(vertical: -30),
                                      /*enabledBorder: new UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),*/
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter answer'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => Qtwenty = val);
                                    },
                                    keyboardType: TextInputType.text,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  //SizedBox(height: 15.0),
                                  RaisedButton(
                                      color: Colors.lightBlue[600],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(1000.0),
                                          side: BorderSide(
                                              color: Colors.lightBlue[600])),
                                      child: Text('Continue',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () async {
                                        DocumentReference docRef = Firestore
                                            .instance
                                            .collection('userData')
                                            .document(user.uid);
                                        DocumentSnapshot doc =
                                            await docRef.get();
                                        List items = doc.data['responses'];
                                        List answers = [
                                          Qsteen.toLowerCase(),
                                          Qseteen.toLowerCase(),
                                          Qeteen.toLowerCase(),
                                          Qnteen.toLowerCase(),
                                          Qtwenty.toLowerCase()
                                        ];
                                        docRef.updateData({
                                          'responses':
                                              FieldValue.arrayUnion(answers)
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Surveythanks()));
                                      }),
                                  //SizedBox(height: 15.0),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0),
                                  ),
                                ]))
                      ]))))),
    );
  }
}
