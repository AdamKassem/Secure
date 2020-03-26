
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:secure/screens/survey/surpc.dart';
import 'package:secure/services/auth.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/constants.dart';
import 'package:secure/shared/loading.dart';
import 'package:secure/screens/settings/settings.dart';

class Surpb extends StatefulWidget {
  final Function toggleView;
  Surpb({this.toggleView});

  @override
  _Surpb createState() => new _Surpb();
// _MyHomePageState createState() => new _MyHomePageState();

}

class _Surpb extends State<Surpb> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String Qsix = '';
  String Qseven = '';
  String Qeight = '';
  String Qnine = '';
  String Qten = '';
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
                                        percent: 0.25,
                                        center: Text("25.0%"),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.blue,

                                      ),
                                    ),

                                    //child: Column(
                                    // children: <Widget>[
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 6'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qsix = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Question 7'),

                                      validator: (val) => val.isEmpty ? 'Please Enter your answer' : null,
                                      onChanged: (val) {
                                        setState(() => Qseven = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 8'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qeight = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: 'Question 9'),

                                      validator: (val) => val.isEmpty ? 'Please Enter your answer' : null,
                                      onChanged: (val) {
                                        setState(() => Qnine = val);
                                      },

                                      keyboardType: TextInputType.text,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Question 10'),

                                      validator: (val) => val.isEmpty? 'Please enter answer': null,
                                      onChanged: (val) {
                                        setState(() => Qten = val);
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
                                            'Continue',
                                            style: TextStyle(
                                                color: Colors.white)
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Surpc())
                                          );
                                        }
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
