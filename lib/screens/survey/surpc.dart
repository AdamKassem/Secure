import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/screens/survey/surpd.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

class Surpc extends StatefulWidget {
  final Function toggleView;
  Surpc({this.toggleView});

  @override
  _Surpc createState() => new _Surpc();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _Surpc extends State<Surpc> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String Qel = '';
  String Qtw = '';
  String Qtteen = '';
  String Qfoteen = '';
  String Qfteen = '';
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
                                      percent: 0.5,
                                      center: Text("50.0%"),
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
                                                "   11. What is your oldest cousin's first name?",
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
                                      hintText: '         Answer Question 11',
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
                                      setState(() => Qel = val);
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
                                                "   12. What is your shoe size?",
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
                                      hintText: '         Answer Question 12',
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
                                      setState(() => Qtw = val);
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
                                                "   13. What is your middle name?",
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
                                      hintText: '         Answer Question 13',
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
                                      setState(() => Qtteen = val);
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
                                                "   14. What was the first phone you got?",
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
                                      hintText: '         Answer Question 14',
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
                                      setState(() => Qfoteen = val);
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
                                                "   15. What’s the last name of your third grade teacher?",
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
                                      hintText: '         Answer Question 15',
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
                                      setState(() => Qfteen = val);
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
                                          Qel.toLowerCase(),
                                          Qtw.toLowerCase(),
                                          Qtteen.toLowerCase(),
                                          Qfoteen.toLowerCase(),
                                          Qfteen.toLowerCase()
                                        ];
                                        docRef.updateData({
                                          'responses':
                                              FieldValue.arrayUnion(answers)
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Surpd()));
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
