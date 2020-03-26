
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
                                        percent: 0.75,
                                        center: Text("75.0%"),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.blue,

                                      ),
                                    ),

                                    //child: Column(
                                    // children: <Widget>[
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 16'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qsteen = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Question 17'),

                                      validator: (val) => val.isEmpty ? 'Please Enter your answer' : null,
                                      onChanged: (val) {
                                        setState(() => Qseteen = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 18'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qeteen = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Question 19'),

                                      validator: (val) => val.isEmpty ? 'Please Enter your answer' : null,
                                      onChanged: (val) {
                                        setState(() => Qnteen = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 20'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qtwenty = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
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
                                            'Finish',
                                            style: TextStyle(
                                                color: Colors.white)
                                        ),
                                       /* onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Surpc())
                                          );
                                        }*/
                                    ),
                                    SizedBox(height: 15.0),
                                    Text(
                                      error,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14.0),
                                    ),


                                  ]
                              )
                          )
                        ]

                    )
                )
            )
        )
    );
  }
}
